import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/constans/app_colors.dart';
import 'package:shout_app/shared/coustom_text.dart';

class CoustomSignUp extends StatelessWidget {
  const CoustomSignUp({super.key, required this.onSignUpTap});
  final void Function() onSignUpTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CoustomText(
          text: 'Don\'t have an account?',
          size: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.GColor,
        ),
        Gap(5),
        GestureDetector(
          onTap: onSignUpTap,
          child: CoustomText(
            text: 'Sign Up',
            size: 20,
            fontWeight: FontWeight.w900,
            color: AppColors.GColor,
          ),
        ),
      ],
    );
  }
}
