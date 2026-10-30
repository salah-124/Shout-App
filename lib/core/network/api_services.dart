import 'package:dio/dio.dart';
import 'package:shout_app/core/network/api_exceptions.dart';
import 'package:shout_app/core/network/dio_auth_client.dart';
import 'package:shout_app/core/network/dio_client.dart';
import 'package:shout_app/features/auth/data/auth_model.dart';

class ApiServices {
  final DioClient _dioClient = DioClient();
  final DioAuthClient _dioAuthClient = DioAuthClient();
  AuthModel? currentUser;

  // Get

  Future<dynamic> get({required String endPoint, required String q}) async {
    try {
      final response = await _dioClient.dio.get(
        endPoint,
        queryParameters: {'q': q, 'language': 'ar'},
      );
      print('Response data: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }

  // Post
  Future<dynamic> post(String endPoint, Map<String, dynamic> data) async {
    try {
      final response = await _dioAuthClient.dio.post(endPoint, data: data);
      print('Response data: ${response.data}');
      return response.data;
    } on DioException catch (e) {
      throw ApiExceptions.handleError(e);
    }
  }
}
