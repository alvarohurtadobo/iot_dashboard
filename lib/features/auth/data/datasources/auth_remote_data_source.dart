import 'package:dio/dio.dart';
import 'package:iot_dashboard/core/constants/api_constants.dart';
import 'package:iot_dashboard/core/network/api_client.dart';
import 'package:iot_dashboard/core/network/api_exceptions.dart';
import 'package:iot_dashboard/features/auth/data/dto/login_request_dto.dart';
import 'package:iot_dashboard/features/auth/data/dto/login_response_dto.dart';
import 'package:iot_dashboard/features/auth/data/dto/logout_request_dto.dart';

/// Interface del DataSource remoto
/// Define el contrato para obtener datos del API
abstract class AuthRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto request);
  Future<void> logout(LogoutRequestDto request);
}

/// Implementación del DataSource remoto para autenticación
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<LoginResponseDto> login(LoginRequestDto request) async {
    try {
      final response = await apiClient.dio.post(
        ApiConstants.login,
        data: request.toJson(),
      );

      return LoginResponseDto.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<void> logout(LogoutRequestDto request) async {
    try {
      await apiClient.dio.post(
        ApiConstants.logout,
        data: request.toJson(),
      );
    } on DioException {
      // Ignorar errores del servidor en logout
      // Siempre continuar con logout local
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

