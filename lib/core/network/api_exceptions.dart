import 'package:dio/dio.dart';
import 'api_error.dart';

class ApiExceptions {
  static ApiError handleError(DioException error) {
    final statusCode = error.response?.statusCode ?? 0;
    final data = error.response?.data;

   const String message = 'Something went wrong';

    if (data is Map<String, dynamic> && data['errors'] != null) {
      return ApiError(
        message: data['errors'].toString(),
        statusCode: statusCode,
      );
    }

    switch (error.type) {
      case DioExceptionType.badCertificate:
        return ApiError(message: 'Bad Certificate', statusCode: statusCode);

      case DioExceptionType.badResponse:
        return ApiError(message: 'Bad Response', statusCode: statusCode);

      case DioExceptionType.cancel:
        return ApiError(message: 'Request Cancelled', statusCode: statusCode);

      case DioExceptionType.connectionError:
        return ApiError(message: 'Connection Error', statusCode: statusCode);

      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection Timeout', statusCode: statusCode);

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive Timeout', statusCode: statusCode);

      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send Timeout', statusCode: statusCode);

      case DioExceptionType.unknown:
        return ApiError(message: 'Unknown Error', statusCode: statusCode);

      default:
        return ApiError(
          message: 'There was an error. We are working to fix it.',
          statusCode: statusCode,
        );
    }
  }
}
