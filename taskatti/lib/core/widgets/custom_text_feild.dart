import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.hint,
    this.validator,
    required this.controller
    
  });
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;

 @override
  @override
 Widget build(BuildContext context) {
   return TextFormField(
    controller:controller ,
    decoration: InputDecoration(
      hintText: hint,
    ),
   ) ;
 }


}
