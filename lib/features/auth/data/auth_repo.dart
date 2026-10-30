import 'package:shout_app/core/network/api_services.dart';
import 'package:shout_app/core/utils/pref_healper.dart';
import 'package:shout_app/features/auth/data/auth_model.dart';

class AuthRepo {
  final ApiServices apiServices = ApiServices();
  AuthModel? cuurrentUser;

  // SignUp
  Future<AuthModel?> signUp(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final response = await apiServices.post('/auth/register', {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    });
    print('SignUp Response: $response');
    if (response is! Map<String, dynamic>) {
      print('Invalid response format: $response');
      return null;
    }
    cuurrentUser = AuthModel.fromJson(response);
    return cuurrentUser;
  }

  // Verify OTP
  Future<bool> verifyOtp(String email, String otp) async {
    final response = await apiServices.post('/auth/verify-email', {
      'email': email,
      'otp': otp,
    });

    print('Verify OTP Response: $response');

    return true;
  }

  // Login
  Future<AuthModel?> login(String email, String password) async {
    final response = await apiServices.post('/auth/login', {
      'email': email,
      'password': password,
    });

    print('Login Response: $response');

    if (response is! Map<String, dynamic>) {
      print('Invalid response format: $response');
      return null;
    }

    cuurrentUser = AuthModel.fromJson(response);

    // حفظ الـ Access Token
    if (cuurrentUser?.accessToken != null &&
        cuurrentUser!.accessToken!.isNotEmpty) {
      await PrefHelper.saveToken(cuurrentUser!.accessToken!);

      print('TOKEN SAVED');
    }

    return cuurrentUser;
  }

  // Forget Password
  Future<bool> forgetPassword(String email) async {
    final response = await apiServices.post('/auth/forgot-password', {
      'email': email,
    });

    print('Forget Password Response: $response');

    return true;
  }

  // Rest Password
  Future<bool> resetPassword(
    String email,
    String otp,
    String newPassword,
  ) async {
    final response = await apiServices.post('/auth/reset-password', {
      "email": email,
      "otp": otp,
      "newPassword": newPassword,
    });
    print('New Response: $response');
    return true;
  }
}
