import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class CoustomSeeAllContainer extends StatelessWidget {
  const CoustomSeeAllContainer({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
    required this.onTap,
  });
  final String image;
  final String title;
  final String desc;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 220,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                  spreadRadius: 1,
                  offset: const Offset(0, 6),
                ),
              ],

              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Gap(15),
        CoustmTextDetailesBG(text1: title, text2: desc, size1: 18, size2: 13),
        Gap(25),
      ],
    );
  }
}
