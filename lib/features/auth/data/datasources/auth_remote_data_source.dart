import 'package:dio/dio.dart';
import 'package:iot_dashboard/core/constants/api_constants.dart';
import 'package:iot_dashboard/core/network/api_client.dart';
import 'package:iot_dashboard/core/network/api_exceptions.dart';
import 'package:iot_dashboard/features/auth/data/dto/login_request_dto.dart';
import 'package:iot_dashboard/features/auth/data/dto/login_response_dto.dart';
import 'package:iot_dashboard/features/auth/data/dto/logout_request_dto.dart';

/// Remote DataSource interface
/// Defines the contract to get data from the API
abstract class AuthRemoteDataSource {
  Future<LoginResponseDto> login(LoginRequestDto request);
  Future<void> logout(LogoutRequestDto request);
}

/// Remote DataSource implementation for authentication
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
      // Ignore server errors on logout
      // Always continue with local logout
    }
  }

  Exception _handleError(DioException error) {
    if (error.response != null) {
      final statusCode = error.response!.statusCode;
      final message = error.response?.data['detail'] ??
          error.response?.data['message'] ??
          'Request error';

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
      return NetworkException('Connection error. Check your internet.');
    }

    return NetworkException('Connection error');
  }
}



