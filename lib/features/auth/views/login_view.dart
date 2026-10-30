import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shout_app/core/network/api_error.dart';
import 'package:shout_app/features/auth/data/auth_repo.dart';
import 'package:shout_app/features/auth/views/forget_password_view.dart';
import 'package:shout_app/features/auth/views/sign_up_view.dart';
import 'package:shout_app/features/auth/widgets/coustom_forget_password.dart';
import 'package:shout_app/features/auth/widgets/coustom_sign_up.dart';
import 'package:shout_app/features/auth/widgets/coustom_text_feild.dart';
import 'package:shout_app/features/auth/widgets/coustom_way_signin.dart';
import 'package:shout_app/root.dart';
import 'package:shout_app/shared/coustom_button.dart';
import 'package:shout_app/shared/coustom_text.dart';
import 'package:shout_app/shared/coustom_text_bg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final GlobalKey<FormState> _FormKey = GlobalKey();
  bool isLoading = false;
  @override
  void dispose() {
    _EmailController.dispose();
    _PasswordController.dispose();
    super.dispose();
  }

  AuthRepo authRepo = AuthRepo();
  Future<void> login() async {
    try {
      if (_FormKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });

        final user = await authRepo.login(
          _EmailController.text.trim(),
          _PasswordController.text.trim(),
        );
        setState(() {
          isLoading = false;
        });

        if (user != null) {
          if (!mounted) return;

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('Login Successful')));

          print('USER NOT NULL');
          print('Access Token: ${user.accessToken}');
          print('Refresh Token: ${user.refreshToken}');
          print('Expires At: ${user.expiresAtUtc}');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Root()),
          );
        } else {
          if (!mounted) return;

          setState(() {
            isLoading = false;
          });
        }
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
      });

      String errorMessage = 'Error In Login';

      if (e is ApiError) {
        errorMessage = e.message;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
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
                  text1: 'Welcome Back 👋',
                  text2:
                      'I am happy to see you again. You can\ncontinue where you left off by logging in',
                ),
                Gap(30),
                CoustomTextFeild(
                  hintText: 'Email Address',
                  prefixIcon: Icon(
                    CupertinoIcons.mail,
                    color: Color(0xff7C82A1),
                  ),
                  controller: _EmailController,
                ),
                Gap(20),
                CoustomTextFeild(
                  hintText: 'Password',
                  prefixIcon: Icon(
                    CupertinoIcons.lock,
                    color: Color(0xff7C82A1),
                  ),
                  controller: _PasswordController,
                ),
                Gap(10),
                CoustomForgetPassword(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgetPasswordView(),
                    ),
                  ),
                ),
                Gap(40),
                CoustomButton(onTap: login, text: 'Sign In'),
                Gap(50),
                CoustomText(
                  text: 'Or',
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
                Gap(40),
                CoustomWaySignin(
                  svgIcon: 'assets/google-icon-logo-svgrepo-com.svg',
                  text: 'Sign In with Google',
                  onTap: () {},
                ),
                Gap(20),
                CoustomWaySignin(
                  svgIcon: 'assets/facebook-3-logo-svgrepo-com.svg',
                  text: 'Sign In with FaceBook',
                  onTap: () {},
                ),
                Gap(80),
                CoustomSignUp(
                  onSignUpTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpView()),
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
