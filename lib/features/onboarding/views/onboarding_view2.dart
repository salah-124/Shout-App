import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/features/auth/views/login_view.dart';
import 'package:shout_app/shared/coustom_button.dart';
import 'package:shout_app/shared/coustom_text.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Gap(240),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/3d-hands.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Gap(170),
            CoustomText(
              text: 'All news in one place, be\nthe first to know last news',
              size: 25,
              fontWeight: FontWeight.w400,
              color: AppColors.GColor,
            ),
            Gap(70),
            CoustomButton(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginView()),
              ),
              text: 'Get Started',
            ),
          ],
        ),
      ),
    );
  }
}
