import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shout_app/core/constans/app_colors.dart';

class CoustomTextFeild extends StatelessWidget {
  const CoustomTextFeild({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.controller,
  });
  final String hintText;
  final Widget? prefixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'The $hintText is Empty Please Fill';
        }
      },
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xff7C82A1)),
        filled: true,
        fillColor: Color(0xffF3F4F6),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.pColor, width: 3),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.pColor, width: 3),
        ),
      ),
    );
  }
}
