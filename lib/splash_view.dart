import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/features/onboarding/views/onboarding_view.dart';

class splashView extends StatefulWidget {
  const splashView({super.key});

  @override
  State<splashView> createState() => _splashViewState();
}

class _splashViewState extends State<splashView> {
  @override
  void initState() {
    Timer.periodic(
      Duration(seconds: 3),
      (timer) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingView()),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset('assets/Logo.svg')],
        ),
      ),
    );
  }
}
