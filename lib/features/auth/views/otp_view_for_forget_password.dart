import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/auth/data/auth_repo.dart';
import 'package:shout_app/features/auth/views/login_view.dart';
import 'package:shout_app/shared/coustom_text.dart';

class OtpViewForForgetPassword extends StatefulWidget {
  const OtpViewForForgetPassword({super.key, required this.email});
  final String email;
  @override
  State<OtpViewForForgetPassword> createState() =>
      _OtpViewForForgetPasswordState();
}

class _OtpViewForForgetPasswordState extends State<OtpViewForForgetPassword> {
   final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  final TextEditingController otpController5 = TextEditingController();
  final TextEditingController otpController6 = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AuthRepo authRepo = AuthRepo();
  Future<void> verifyOtp() async {
    if (formKey.currentState!.validate()) {
      final otp =
          otpController1.text +
          otpController2.text +
          otpController3.text +
          otpController4.text +
          otpController5.text +
          otpController6.text;
      final success = await authRepo.verifyOtp(widget.email, otp);
      if (success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                RestPasswordView(email: widget.email, otp: otp),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    }
  }

  Future<void> restpassword() async {
    if (formKey.currentState!.validate()) {
      final otp =
          otpController1.text +
          otpController2.text +
          otpController3.text +
          otpController4.text +
          otpController5.text +
          otpController6.text;
      final success = await authRepo.resetPassword(
        widget.email,
        otp,
        _Resetcontroller.text,
      );
      if (success) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginView()),
        );
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Password Is Short')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Form(
          key:formKey ,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(100),
              CoustomText(
                text: 'Reset Password',
                color: Colors.black,
                size: 24,
                fontWeight: FontWeight.w900,
              ),
              Gap(15),
              const CoustomText(
                text:
                    'You need to enter 4-digit code we send to your email adress :',
                color: Colors.grey,
                size: 24,
                fontWeight: FontWeight.w500,
              ),
              const Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}
