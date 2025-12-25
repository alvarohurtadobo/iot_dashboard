import 'package:dio/dio.dart';
import 'package:iot_dashboard/core/constants/api_constants.dart';
import 'package:iot_dashboard/core/network/api_interceptors.dart';
import 'package:iot_dashboard/core/storage/token_storage.dart';

class ApiClient {
  late final Dio _dio;
  final TokenStorage tokenStorage;

  ApiClient(this.tokenStorage) {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _dio.interceptors.add(AuthInterceptor(tokenStorage, _dio));
    
    // Log interceptor para debugging (solo en desarrollo)
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));
  }

  Dio get dio => _dio;
}

