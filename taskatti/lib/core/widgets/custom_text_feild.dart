import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    super.key,
    this.hint,
    this.validator,
    required this.controller,
    this.maxlines = 1,
    this.icon,
    this.readonly=false
  });
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final int maxlines;
  final Widget? icon;
  final bool readonly ;
  @override
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readonly,
      controller: controller,
      maxLines: maxlines,
      decoration: InputDecoration(hintText: hint, suffixIcon: icon),
    );
  }
}
