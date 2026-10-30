class ApiError {
  final String message;
  final int statusCode;

  ApiError({required this.message, required this.statusCode});

  @override
  String toString() {
    return 'Api Error : { Message : $message, StatusCode : $statusCode}';
  }
}
