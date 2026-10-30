import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomProfileContainer extends StatelessWidget {
  const CoustomProfileContainer({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.GColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Gap(20),
          CoustomText(text: text, size: 22, fontWeight: FontWeight.w600),
          Spacer(),
          icon,
          Gap(10),
        ],
      ),
    );
  }
}
