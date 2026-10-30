import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustmTextDetailes extends StatelessWidget {
  const CoustmTextDetailes({
    super.key,
    required this.text1,
    required this.text2,
  });
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CoustomText(text: text1, size: 30, fontWeight: FontWeight.w900),
        Gap(20),
        CoustomText(
          text: text2,
          size: 24,
          fontWeight: FontWeight.w500,
          color: AppColors.GColor,
        ),
      ],
    );
  }
}
