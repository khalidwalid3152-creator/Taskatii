import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';
import 'package:taskatti/core/widgets/custom_text_feild.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  List<Color> colors = [
    Appcolors.primaryColor,
    Appcolors.orangeColor,
    Appcolors.pinkColor,
  ];
  int currentindex = 0;
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Appcolors.primaryColor,
        title: Text(
          'Add Task',
          style: TextStyles.titleStyle(color: Appcolors.primaryColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title', style: TextStyles.bodyStyle()),
              Gap(6),
              CustomTextFeild(
                controller: namecontroller,
                hint: 'Enter Task Title',
              ),
              Gap(20),
              Text('Description', style: TextStyles.bodyStyle()),
              Gap(6),
              CustomTextFeild(
                controller: namecontroller,
                hint: 'Enter Task Description',
                maxlines: 4,
              ),
        
              Gap(20),
              Text('Date', style: TextStyles.bodyStyle()),
              Gap(6),
              CustomTextFeild(
                controller: datecontroller,
                icon: Icon(
                  Icons.calendar_month_rounded,
                  color: Appcolors.primaryColor,
                ),
                readonly: true,
              ),
              Gap(10),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Start Time', style: TextStyles.bodyStyle()),
                        CustomTextFeild(
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
              ),
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
                      child: currentindex==index?Icon(Icons.check,color: Appcolors.whiteColor,):null
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
}
