import 'package:equatable/equatable.dart';

/// Domain model para tokens de autenticación
/// Representa los tokens en el dominio de la aplicación
class AuthTokens extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  const AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  @override
  List<Object> get props => [accessToken, refreshToken, tokenType];
}

