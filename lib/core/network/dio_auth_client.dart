import 'package:dio/dio.dart';
import 'package:shout_app/core/utils/pref_healper.dart';

class DioAuthClient {
  final Dio _dioAuth = Dio(
    BaseOptions(
      baseUrl: 'https://accessories-eshop.runasp.net/api',
      headers: {'Content-Type': 'application/json'},
    ),
  );
  DioAuthClient() {
    _dioAuth.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    _dioAuth.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await PrefHelper.getToken();

          print('TOKEN FROM PREF: $token');

          if (token != null && token.isNotEmpty && token != 'guest') {
            options.headers['Authorization'] = 'Bearer $token';
          }

          print('AUTH HEADER: ${options.headers['Authorization']}');

          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
  Dio get dio => _dioAuth;
}
