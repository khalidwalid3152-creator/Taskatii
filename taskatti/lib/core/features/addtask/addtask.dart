import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskatti/core/constants/task_color.dart';
import 'package:taskatti/core/features/home/page/home.dart';
import 'package:taskatti/core/model/model_task.dart';
import 'package:taskatti/core/services/data_helper.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';
import 'package:taskatti/core/widgets/custom_text_feild.dart';
import 'package:taskatti/core/widgets/main_button.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {

  int currentindex = 0;
  var namecontroller = TextEditingController();

  var datecontroller = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  var descriptioncontroller = TextEditingController();
  var startcontroller = TextEditingController(
    text: DateFormat("hh-mm a").format(DateTime.now()),
  );
  var endcontroller = TextEditingController(
    text: DateFormat("hh-mm a").format(DateTime.now()),
  );

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
          child: mainButton(
            ontap: () async {
              if (formkey.currentState!.validate()) {
                String id =
                    DateTime.now().toString() + namecontroller.text.toString();
                await DataHelper.puttask(
                  id,
                   ModelTask(
                    id: id,
                    title: namecontroller.text,
                    description: descriptioncontroller.text,
                    date: datecontroller.text,
                    startTime: startcontroller.text,
                    endTime: endcontroller.text,
                    color: currentindex,
                    iscompleted: false,
                  ),
                );
              }
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),
                (Route<dynamic> route) => false,
              );
            },
            text: 'Create Task',
          ),
        ),
      ),
      appBar: AppBar(
        foregroundColor: Appcolors.primaryColor,
        title: Text(
          'Add Task',
          style: TextStyles.titleStyle(color: Appcolors.primaryColor),
        ),
      ),
      body: addtask_body(context),
    );
  }

  SingleChildScrollView addtask_body(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: TextStyles.bodyStyle()),
              Gap(6),
              CustomTextFeild(
                controller: namecontroller,
                hint: 'Enter Task Title',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter task title';
                  }
                  return null;
                },
              ),
              Gap(20),
              Text('Description (optional)', style: TextStyles.bodyStyle()),
              Gap(6),
              CustomTextFeild(
                controller: descriptioncontroller,
                hint: 'Enter Task Description',
                maxlines: 4,
              ),

              Gap(20),
              Text('Date', style: TextStyles.bodyStyle()),
              Gap(6),
              CustomTextFeild(
                ontap: () async {
                  var selecteddate = await showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050),
                    initialDate: DateTime.now(),
                  );
                  if (selecteddate != null) {
                    datecontroller.text = DateFormat(
                      "yyyy-MM-dd",
                    ).format(selecteddate);
                  }
                },
                controller: datecontroller,
                icon: Icon(
                  Icons.calendar_month_rounded,
                  color: Appcolors.primaryColor,
                ),
                readonly: true,
              ),
              Gap(10),
              timeRow(),
              Gap(10),
              Row(
                spacing: 6,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentindex = index;
                      });
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: colors[index],
                      child: currentindex == index
                          ? Icon(Icons.check, color: Appcolors.whiteColor)
                          : null,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row timeRow() {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Start Time', style: TextStyles.bodyStyle()),
              CustomTextFeild(
                ontap: () async {
                  var selectedtime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedtime != null) {
                    startcontroller.text = selectedtime.format(context);
                  }
                },
                controller: startcontroller,
                icon: Icon(
                  Icons.watch_later_outlined,
                  color: Appcolors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('End Time', style: TextStyles.bodyStyle()),

              CustomTextFeild(
                ontap: () async {
                  var selectedtime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedtime != null) {
                    endcontroller.text = selectedtime.format(context);
                  }
                },
                controller: endcontroller,
                icon: Icon(
                  Icons.watch_later_outlined,
                  color: Appcolors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
