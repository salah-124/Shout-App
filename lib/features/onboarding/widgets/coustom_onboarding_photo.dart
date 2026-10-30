import 'package:flutter/material.dart';

class CoustomOnboardingPhoto extends StatelessWidget {
  const CoustomOnboardingPhoto({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height: 372,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(image)),
      ),
    );
  }
}
