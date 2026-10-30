import 'package:flutter/material.dart';
import 'package:shout_app/core/constans/app_colors.dart';

class CoustomButton extends StatelessWidget {
  const CoustomButton({super.key, required this.onTap, required this.text});
  final void Function() onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 380,
        height: 65,
        decoration: BoxDecoration(
          color: AppColors.pColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ),
    );
  }
}
