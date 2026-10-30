import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/features/auth/data/auth_repo.dart';
import 'package:shout_app/features/auth/views/login_view.dart';
import 'package:shout_app/features/auth/views/otp_for_signup.dart';
import 'package:shout_app/features/auth/widgets/coustom_log_in.dart';
import 'package:shout_app/features/auth/widgets/coustom_text_feild.dart';
import 'package:shout_app/root.dart';
import 'package:shout_app/shared/coustom_button.dart';
import 'package:shout_app/shared/coustom_text.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final TextEditingController _LastNameController = TextEditingController();
  final GlobalKey<FormState> _FormKey = GlobalKey();
  final AuthRepo authRepo = AuthRepo();
  bool isLoading = false;

  Future<void> signup() async {
    try {
      if (_FormKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        final data = await authRepo.signUp(
          _NameController.text,
          _LastNameController.text,
          _EmailController.text.trim(),
          _PasswordController.text.trim(),
        );
        setState(() {
          isLoading = false;
        });

        if (data != null) {
          if (!mounted) return;

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('SignUp Successful')));

          print('USER NOT NULL');
          print('Access Token: ${data.accessToken}');
          print('Refresh Token: ${data.refreshToken}');
          print('Expires At: ${data.expiresAtUtc}');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  OtpForSignup(email: _EmailController.text.trim()),
            ),
          );
        } else {
          if (!mounted) return;

          setState(() {
            isLoading = false;
          });
        }
      }
    } on Exception catch (e) {
      // TODO
    }
  }

  @override
  void dispose() {
    _EmailController.dispose();
    _NameController.dispose();
    _PasswordController.dispose();
    _LastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _FormKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(70),
                CoustmTextDetailesBG(
                  text1: 'Welcome to Shout 👋',
                  text2:
                      'Hello, I guess you are new around here. You can start using the application after sign up.',
                ),
                Gap(30),
                CoustomTextFeild(
                  hintText: 'Name',
                  prefixIcon: Icon(
                    CupertinoIcons.person,
                    color: Color(0xff7C82A1),
                  ),
                  controller: _NameController,
                ),
                Gap(20),
                CoustomTextFeild(
                  hintText: 'Last Name',
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: Color(0xff7C82A1),
                  ),
                  controller: _LastNameController,
                ),
                Gap(20),
                CoustomTextFeild(
                  hintText: 'Email',
                  prefixIcon: Icon(
                    CupertinoIcons.lock,
                    color: Color(0xff7C82A1),
                  ),
                  controller: _EmailController,
                ),
                Gap(20),
                CoustomTextFeild(
                  hintText: ' Password',
                  prefixIcon: Icon(
                    CupertinoIcons.lock,
                    color: Color(0xff7C82A1),
                  ),
                  controller: _PasswordController,
                ),
                Gap(40),
                CoustomButton(onTap: signup, text: 'Sign Up'),
                Gap(90),
                CoustomText(
                  text: 'Or',
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                Gap(50),
                CoustomLogIn(
                  onSignUpTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
