import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomWaySignin extends StatelessWidget {
  const CoustomWaySignin({
    super.key,
    required this.svgIcon,
    required this.text,
    required this.onTap,
  });
  final String svgIcon;
  final String text;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: 380,
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: .7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(svgIcon, height: 40),
            Gap(70),
            CoustomText(text: text, size: 18, fontWeight: FontWeight.w400),
          ],
        ),
      ),
    );
  }
}
