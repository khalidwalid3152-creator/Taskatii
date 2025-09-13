import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:taskatti/core/features/home/widget/task_item.dart';
import 'package:taskatti/core/model/model_task.dart';
import 'package:taskatti/core/services/data_helper.dart';
import 'package:taskatti/core/utils/colors.dart';

class TaskListBuilder extends StatefulWidget {
  const TaskListBuilder({super.key});

  @override
  State<TaskListBuilder> createState() => _TaskListBuilderState();
}

class _TaskListBuilderState extends State<TaskListBuilder> {
  String selectesdate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          DatePicker(
            height: 100,
            width: 70,

            DateTime.now(),
            initialSelectedDate: DateTime.now(),
            selectionColor: Appcolors.primaryColor,
            selectedTextColor: Colors.white,
            onDateChange: (date) {
              // New date selected
              setState(() {
                selectesdate = DateFormat("yyyy-MM-dd").format(date);
              });
            },
          ),
          Gap(20),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: DataHelper.taskbox.listenable(),
              builder: (context, box, child) {
                List<ModelTask> tasks = [];
                for (var task in box.values) {
                  if (task.date == selectesdate) {
                    tasks.add(task);
                  }
                }

                return ListView.separated(
                  itemBuilder: (context, index) {
                    return taskItem(model: tasks[index]);
                  },
                  separatorBuilder: (context, index) => Gap(10),
                  itemCount: tasks.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
