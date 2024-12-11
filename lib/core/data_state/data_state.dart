class ApiResponse<T> {
  T? data;
  int? statusCode;
  bool? success;
  String? statusMessage;

  ApiResponse({
    this.data,
    this.statusCode,
    this.success,
    this.statusMessage,
  });

  @override
  String toString() {
    return 'ApiResponse<$T>{data: $data, statusCode: $statusCode, success: $success, statusMessage: $statusMessage}';
  }
}
