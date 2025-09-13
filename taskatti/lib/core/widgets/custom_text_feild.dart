import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.hint,
    this.validator,
    required this.controller,
    this.maxlines = 1,
    this.icon,
    this.readonly = false,  this.ontap,
  });
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final int maxlines;
  final Widget? icon;
  final bool readonly;
  final Function()? ontap;
  @override
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      readOnly: readonly,
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(hintText: hint, suffixIcon: icon),
      validator: validator,
    );
  }
}
