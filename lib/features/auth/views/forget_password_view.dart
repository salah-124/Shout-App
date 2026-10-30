import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/auth/data/auth_repo.dart';
import 'package:shout_app/features/auth/views/otp_view_for_forget_password.dart';
import 'package:shout_app/features/auth/widgets/coustom_text_feild.dart';
import 'package:shout_app/shared/coustom_button.dart';
import 'package:shout_app/shared/coustom_text.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _EmailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  AuthRepo authRepo = AuthRepo();
  Future<void> forgetPassword() async {
    try {
      if (_formKey.currentState!.validate()) {
        final success = await authRepo.forgetPassword(
          _EmailController.text.trim(),
        );

        if (success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OtpViewForForgetPassword(email: _EmailController.text.trim()),
            ),
          );
          if (!mounted) return;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Email sent successfully')),
          );
        } else {
          if (!mounted) return;

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Failed to send email')));
        }
      }
    } catch (e) {
      print('Error during forget password: $e');
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('An error occurred')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(70),
              CoustomText(
                text: 'Forgot Password',
                color: Colors.black,
                size: 24,
                fontWeight: FontWeight.w900,
              ),
              const Gap(60),
              const CoustomText(
                text:
                    'We need your email adress so we can send you the password reset code.',
                color: Colors.black45,
                size: 24,
                fontWeight: FontWeight.w500,
              ),
              const Gap(30),
              CoustomTextFeild(
                hintText: 'Email Address',
                prefixIcon: Icon(CupertinoIcons.mail, color: Color(0xff7C82A1)),
                controller: _EmailController,
              ),
              Spacer(),
              Center(
                child: CoustomButton(onTap: forgetPassword, text: 'Next'),
              ),
              Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
