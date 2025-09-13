
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:taskatti/core/features/home/widget/headerdate.dart';
import 'package:taskatti/core/features/home/widget/headerhome.dart';
import 'package:taskatti/core/features/home/widget/task_list_builder.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              headerhome(),
              Gap(20),
              Headerdate(),
              Gap(20),
              // DatePicker(
              //   height: 100,
              //   width: 70,

              //   DateTime.now(),
              //   initialSelectedDate: DateTime.now(),
              //   selectionColor: Appcolors.primaryColor,
              //   selectedTextColor: Colors.white,
              //   // onDateChange: (date) {
              //   //   // New date selected
              //   //   setState(() {
              //   //     _selectedValue = date;
              //   //   });
              //   // },
              // ),
              // Gap(20),
              TaskListBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
