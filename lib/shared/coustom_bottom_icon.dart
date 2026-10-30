import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shout_app/core/constans/app_colors.dart';

class CoustomBottomIcon extends StatelessWidget {
  const CoustomBottomIcon({
    super.key,
    required this.image,
    required this.onTap,
    required this.isPressed,
  });
  final String image;
  final void Function() onTap;
  final bool isPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        image,
        color: isPressed ? AppColors.pColor : Colors.black,
        width: 35,
      ),
    );
  }
}
