import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomCategory2 extends StatelessWidget {
  const CoustomCategory2({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });
  final String image;
  final String title;
  final String subTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 190,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.withOpacity(0.15), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 15,
              spreadRadius: 1,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                      color: AppColors.GColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(image),
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: Icon(CupertinoIcons.forward, size: 30),
                  ),
                ],
              ),
              Gap(15),
              CoustomText(text: title, size: 22, fontWeight: FontWeight.w900),
              Gap(5),
              CoustomText(
                text: subTitle,
                size: 15,
                fontWeight: FontWeight.w600,
                color: AppColors.GColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
