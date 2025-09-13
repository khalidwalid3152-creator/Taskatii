import 'package:flutter/material.dart';
import 'package:taskatti/core/constants/task_color.dart';
import 'package:taskatti/core/model/model_task.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';

class taskItem extends StatelessWidget {
  const taskItem({super.key, required this.model});
  final ModelTask model;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:colors[model.color!],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 10,
                children: [
                  Text(
                    model.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyles.bodyStyle(color: Appcolors.whiteColor),
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Icon(
                        Icons.watch_later_outlined,
                        color: Appcolors.whiteColor,
                        size: 18,
                      ),
                      Text(
                        '${model.startTime} : ${model.endTime}',
                        style: TextStyles.smallStyle(
                          color: Appcolors.whiteColor,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    (model.description?.isNotEmpty == true)
                        ? model.description??''
                        : '___',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.smallStyle(color: Appcolors.whiteColor),
                  ),
                ],
              ),
            ),
            Container(width: 1, height: 60, color: Appcolors.whiteColor),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                model.iscompleted==true?'completed': 'TODO',

                style: TextStyles.bodyStyle(
                  color: Appcolors.whiteColor,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

   colorcontainer(int color){
    if(color==0){
      return Appcolors.primaryColor;
    }else if(color==1){
      return Appcolors.orangeColor;
    }else if(color==2){
      return Appcolors.pinkColor;
    }
  }
}
