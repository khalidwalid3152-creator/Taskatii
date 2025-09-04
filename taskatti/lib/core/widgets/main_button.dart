import 'package:flutter/material.dart';
import 'package:taskatti/core/utils/colors.dart';
import 'package:taskatti/core/utils/styles.dart';

class mainButton extends StatelessWidget {
  const mainButton({super.key,required this.ontap, required this.text});
  final String text;
  final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(280, 50),
        backgroundColor: Appcolors.primaryColor,
        foregroundColor: Appcolors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
        ),
      ),
      onPressed: ontap,
      child: Text(
        text,
        style: TextStyles.titleStyle(
          color: Appcolors.whiteColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
