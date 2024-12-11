import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../data_state/data_state.dart';
import '../enum/method_type_enum.dart';
import 'api_client_interface.dart';

class DioClient implements ApiClient {
  late Dio _client;

  DioClient()
  // : assert(
  //     //Stop the app in case env is not initialized
  //     dotenv.env['BASE_API_URL'] == null,
  //     "BASE_API_URL MUST NOT BE NULL!",
  //   )
  {
    final baseApiUrl = dotenv.env['BASE_API_URL'];

    _client = Dio()..options.baseUrl = baseApiUrl ?? "";
    // ..interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       // options.queryParameters['api_key'] = 'your-api-key';
    //       return handler.next(options);
    //     },
    //   ),
    // );
  }

  @override
  void removeToken() {
    _client.options.headers.remove('Authorization');
  }

  @override
  void setToken(String token) {
    _client.options.headers['Authorization'] = 'Bearer $token';
  }

  @override
  Future<ApiResponse<T>> request<T>({
    required String path,
    required MethodType method,
    Map<String, dynamic>? payload,
    Map<String, dynamic>? queryParameters,
    T Function(Map<String, dynamic> json)? fromJson,
  }) async {
    ApiResponse<T> apiResponse;
    Response response;
    try {
      switch (method) {
        case MethodType.get:
          response = await _client.get(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.post:
          response = await _client.post(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.put:
          response = await _client.put(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.delete:
          response = await _client.delete(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
        case MethodType.patch:
          response = await _client.patch(
            path,
            data: payload,
            queryParameters: queryParameters,
          );
          break;
      }
      apiResponse = ApiResponse(
        data: fromJson == null ? response.data : fromJson.call(response.data),
        statusCode: response.statusCode,
        success: true,
        statusMessage: response.statusMessage,
      );
    } on DioException catch (e) {
      apiResponse = ApiResponse(
        statusCode: e.stackTrace.hashCode,
        statusMessage: e.message,
        success: false,
      );
      log(e.toString());
    } catch (e) {
      apiResponse = ApiResponse(
        statusMessage: e.toString(),
        success: false,
      );
    }
    return apiResponse;
  }

  @override
  String handleException(Exception exception) {
    // TODO: implement handleException
    throw UnimplementedError();
  }
}
