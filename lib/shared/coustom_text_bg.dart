import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustmTextDetailesBG extends StatelessWidget {
  const CoustmTextDetailesBG({
    super.key,
    required this.text1,
    required this.text2,
    this.size1 = 30,
    this.size2 = 22,
  });
  final String text1;
  final String text2;
  final double size1;
  final double size2;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CoustomText(text: text1, size: size1, fontWeight: FontWeight.w900),
        Gap(20),
        CoustomText(
          text: text2,
          size: size2,
          fontWeight: FontWeight.normal,
          color: AppColors.GColor,
        ),
      ],
    );
  }
}
