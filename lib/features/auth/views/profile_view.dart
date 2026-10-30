import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/features/auth/widgets/coustom_profile_container.dart';
import 'package:shout_app/shared/coustom_text.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(70),
            CoustomText(text: 'Profile', size: 25, fontWeight: FontWeight.w900),
            Gap(20),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/1760711895303.jpg'),
                ),
                Gap(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CoustomText(
                      text: 'Salah Ayman',
                      size: 24,
                      fontWeight: FontWeight.w900,
                    ),

                    CoustomText(
                      text: 'salahayman@gmail.com',
                      size: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.GColor,
                    ),
                  ],
                ),
              ],
            ),
            Gap(40),
            CoustomProfileContainer(
              text: 'Notifications',
              icon: Switch(value: true, onChanged: (value) {}),
            ),
            Gap(20),
            CoustomProfileContainer(
              text: 'Language',
              icon: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.forward,
                  size: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Gap(20),
            CoustomProfileContainer(
              text: 'Change Password',
              icon: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.forward,
                  size: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Gap(40),
            CoustomProfileContainer(
              text: 'Privacy',
              icon: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.forward,
                  size: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Gap(20),
            CoustomProfileContainer(
              text: 'Terms & Conditions',
              icon: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.forward,
                  size: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Gap(40),
            CoustomProfileContainer(
              text: 'Sign Out',
              icon: IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.square_arrow_right,
                  size: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
