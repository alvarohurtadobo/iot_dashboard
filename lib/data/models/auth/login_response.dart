import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  const LoginResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json['access_token'] ?? '',
        refreshToken: json['refresh_token'] ?? '',
        tokenType: json['token_type'] ?? 'bearer',
      );

  @override
  List<Object> get props => [accessToken, refreshToken, tokenType];
}

