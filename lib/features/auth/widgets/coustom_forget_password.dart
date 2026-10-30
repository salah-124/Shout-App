import 'package:flutter/material.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomForgetPassword extends StatelessWidget {
  const CoustomForgetPassword({super.key, required this.onTap});
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: CoustomText(
            text: 'Forgot Password?',
            color: Colors.grey.shade600,
            size: 22,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
