import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskatti/core/features/addtask/addtask.dart';

import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';
import 'package:taskatti/core/widgets/main_button.dart';

class Headerdate extends StatelessWidget {
  const Headerdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.yMMMd().format(DateTime.now()),
              style: TextStyles.titleStyle(color: Appcolors.darkColor),
            ),
            Text('Today', style: TextStyles.titleStyle()),
          ],
        ),
        SizedBox(
          width: 140,
          height: 40,
          child: mainButton(
            ontap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addtask()),
              );
            },
            text: '+ Add Task',
          ),
        ),
      ],
    );
  }
}
