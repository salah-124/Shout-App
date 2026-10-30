import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/auth/data/auth_repo.dart';
import 'package:shout_app/features/auth/views/login_view.dart';
import 'package:shout_app/features/auth/widgets/coustom_otp_container.dart';
import 'package:shout_app/shared/coustom_button.dart';
import 'package:shout_app/shared/coustom_text.dart';

class OtpForSignup extends StatefulWidget {
  const OtpForSignup({super.key, required this.email});
  final String email;
  @override
  State<OtpForSignup> createState() => _OtpForSignupState();
}

class _OtpForSignupState extends State<OtpForSignup> {
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  final TextEditingController otpController5 = TextEditingController();
  final TextEditingController otpController6 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthRepo authRepo = AuthRepo();
  Future<void> otpSignUp() async {
    if (_formKey.currentState!.validate()) {
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
          MaterialPageRoute(builder: (context) => LoginView()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
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
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(70),
              CoustomText(
                text: 'Verify Email',
                size: 28,
                fontWeight: FontWeight.w900,
              ),
              Gap(15),
              CoustomText(
                text:
                    'You need to enter 6-digit code we send to your email adress :',
                size: 25,
                fontWeight: FontWeight.w900,
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CoustomOtpContainer(
                    controller: otpController1,
                    onChanged: (p0) {
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CoustomOtpContainer(
                    controller: otpController2,
                    onChanged: (p0) {
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CoustomOtpContainer(
                    controller: otpController3,
                    onChanged: (p0) {
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CoustomOtpContainer(
                    controller: otpController4,
                    onChanged: (p0) {
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CoustomOtpContainer(
                    controller: otpController5,
                    onChanged: (p0) {
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                  CoustomOtpContainer(
                    controller: otpController6,
                    onChanged: (p0) {
                      if (p0.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                ],
              ),
              Spacer(),
              Center(
                child: CoustomButton(onTap: otpSignUp, text: 'VERIFY'),
              ),
              Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
