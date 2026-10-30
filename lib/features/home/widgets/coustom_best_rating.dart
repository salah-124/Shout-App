import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomBestRating extends StatelessWidget {
  const CoustomBestRating({
    super.key,
    required this.image,
    required this.categoryTyoe,
    required this.title,
    required this.onTap,
  });
  final String image;
  final String categoryTyoe;
  final String title;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: 300,
            height: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoustomText(
                  text: categoryTyoe,
                  size: 12,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
                Gap(30),
                CoustomText(
                  text: title,
                  size: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
