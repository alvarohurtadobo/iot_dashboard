import 'package:dio/dio.dart';
import 'package:iot_dashboard/core/constants/api_constants.dart';
import 'package:iot_dashboard/core/network/api_client.dart';
import 'package:iot_dashboard/core/network/api_exceptions.dart';
import 'package:iot_dashboard/data/models/auth/login_request.dart';
import 'package:iot_dashboard/data/models/auth/login_response.dart';
import 'package:iot_dashboard/data/models/auth/logout_request.dart';
import 'package:iot_dashboard/data/models/auth/refresh_token_request.dart';
import 'package:iot_dashboard/data/models/auth/refresh_token_response.dart';

class AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSource(this.apiClient);

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> logout(LogoutRequest request) async {
    try {
      await apiClient.dio.post(
        ApiConstants.logout,
        data: request.toJson(),
      );
    } on DioException catch (e) {
      // Continuar con logout local incluso si falla el servidor
      throw _handleError(e);
    }
  }

  Future<RefreshTokenResponse> refreshToken(RefreshTokenRequest request) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.refreshToken,
        data: request.toJson(),
      );

      return RefreshTokenResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Exception _handleError(DioException error) {
    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      final message = error.response?.data['detail'] ?? 
                     error.response?.data['message'] ?? 
                     'Error en la petición';

      switch (statusCode) {
        case 401:
          return UnauthorizedException(message);
        case 423:
          return AccountLockedException(message);
        case 429:
          return RateLimitException(message);
        default:
          return ApiException(message, statusCode);
      }
    }
    
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.connectionError) {
      return NetworkException('Error de conexión. Verifica tu internet.');
    }
    
    return NetworkException('Error de conexión');
  }
}

