import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomCategoryContainer extends StatelessWidget {
  const CoustomCategoryContainer({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 180,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: Center(
          child: CoustomText(
            text: title,
            size: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
