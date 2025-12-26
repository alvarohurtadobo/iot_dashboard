import 'package:equatable/equatable.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_tokens.dart';

/// DTO (Data Transfer Object) para la respuesta de login
/// Representa los datos tal como vienen del API
class LoginResponseDto extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  const LoginResponseDto({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      LoginResponseDto(
        accessToken: json['access_token'] ?? '',
        refreshToken: json['refresh_token'] ?? '',
        tokenType: json['token_type'] ?? 'bearer',
      );

  /// Convierte el DTO al modelo de dominio
  AuthTokens toDomain() {
    return AuthTokens(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
    );
  }

  @override
  List<Object> get props => [accessToken, refreshToken, tokenType];
}

