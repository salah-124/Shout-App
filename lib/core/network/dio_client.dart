import 'package:dio/dio.dart';
import 'package:shout_app/core/utils/pref_healper.dart';

class DioClient {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://newsapi.org/v2/',
      headers: {'X-Api-Key': '032dc44d0c71460b96fc5437476b7b76'},
    ),
  );
  DioClient() {
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    _dio.interceptors.add(
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
  Dio get dio => _dio;
}
