import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomCategoryAppBar extends StatelessWidget {
  const CoustomCategoryAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            CupertinoIcons.back,
            size: 30,
            fontWeight: FontWeight.w900,
          ),
        ),
        Gap(30),
        CoustomText(text:'$title News', size: 30, fontWeight: FontWeight.w900),
      ],
    );
  }
}
