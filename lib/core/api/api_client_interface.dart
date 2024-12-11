import '../data_state/data_state.dart';
import '../enum/method_type_enum.dart';

abstract class ApiClient {
  Future<ApiResponse<T>> request<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? fromJson,
  });

  void setToken(String token);
  void removeToken();
  String handleException(Exception exception);
}
