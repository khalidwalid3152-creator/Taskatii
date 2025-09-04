import 'package:flutter/material.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';

showErorrDailog(BuildContext context, String text){

   ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 0,
        content: Text(text,style: TextStyles.bodyStyle(color: Appcolors.whiteColor),),
        backgroundColor: Appcolors.pinkColor,
      ),
    );
}