import 'package:flutter/material.dart';
import 'package:shout_app/core/constans/app_colors.dart';

class CoustomSelectedContainer extends StatelessWidget {
  const CoustomSelectedContainer({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: 30,
      height: isSelected ? 30 : 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.pColor : AppColors.GColor,
      ),
    );
  }
}
