import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoustomOtpContainer extends StatelessWidget {
  const CoustomOtpContainer({super.key, this.onChanged, this.controller});
  final bool obscureText = false;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          return null;
        },
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
        obscureText: obscureText,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '0',
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
        ),
      ),
    );
  }
}
