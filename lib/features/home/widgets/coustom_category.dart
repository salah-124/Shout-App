import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomCategory extends StatelessWidget {
  const CoustomCategory({
    super.key,
    required this.CategoryTitlte,
    required this.isSelcted,
    required this.onTap,
  });
  final String CategoryTitlte;
  final bool isSelcted;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isSelcted ? AppColors.pColor : AppColors.GColor,
        ),
        child: Center(
          child: CoustomText(
            text: CategoryTitlte,
            size: 20,
            fontWeight: FontWeight.w600,
            color: isSelcted ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
