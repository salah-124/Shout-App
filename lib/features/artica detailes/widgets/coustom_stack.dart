import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/shared/coustom_icon.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomStack extends StatelessWidget {
  const CoustomStack({
    super.key,
    required this.image,
    required this.onBookMarkPressed,
    required this.onSharedPressed,
    required this.theCompany,
    required this.title,
    required this.avatar,
    required this.avatarName,
    required this.avatarJop,
  });
  final String image;
  final void Function() onBookMarkPressed;
  final void Function() onSharedPressed;
  final String theCompany;
  final String title;
  final String avatar;
  final String avatarName;
  final String avatarJop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 450,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 65,
          child: Row(
            children: [
              CoustomIcon(
                icon: CupertinoIcons.back,
                onPressed: () => Navigator.pop(context),
              ),
              Gap(320),
              Column(
                children: [
                  CoustomIcon(
                    icon: CupertinoIcons.bookmark,
                    onPressed: onBookMarkPressed,
                  ),
                  Gap(20),
                  CoustomIcon(
                    icon: CupertinoIcons.arrowshape_turn_up_right,
                    onPressed: onSharedPressed,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 170,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: 130,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.pColor,
              ),
              child: Center(
                child: CoustomText(
                  text: theCompany,
                  size: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 95,
          left: 20,
          right: 0,
          child: CoustomText(
            text: title,
            size: 25,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: AssetImage(avatar)),
              Gap(20),
              Column(
                children: [
                  Text(
                    avatarName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gap(5),
                  Text(
                    avatarJop,
                    style: TextStyle(
                      color: AppColors.GColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
