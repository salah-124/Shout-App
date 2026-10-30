import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/onboarding/views/onboarding_view2.dart';
import 'package:shout_app/features/onboarding/widgets/coustm_text_detailes.dart';
import 'package:shout_app/features/onboarding/widgets/coustom_onboarding_photo.dart';
import 'package:shout_app/features/onboarding/widgets/coustom_selected_container.dart';
import 'package:shout_app/shared/coustom_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  List<String> images = [
    'assets/onBoarding2.png',
    'assets/onBoarding1.png',
    'assets/onBoarding3.png',
  ];

  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              Gap(120),
              SizedBox(
                height: 372,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return CoustomOnboardingPhoto(image: images[index]);
                  },
                ),
              ),
              Gap(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CoustomSelectedContainer(isSelected: currentIndex == 0),
                  CoustomSelectedContainer(isSelected: currentIndex == 1),
                  CoustomSelectedContainer(isSelected: currentIndex == 2),
                ],
              ),
              Gap(40),
              CoustmTextDetailes(
                text1: 'First to know',
                text2: 'All news in one place, be\nthe first to know last news',
              ),
              Gap(100),
              CoustomButton(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => OnboardingView2()),
                ),
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
