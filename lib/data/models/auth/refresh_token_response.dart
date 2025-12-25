import 'package:equatable/equatable.dart';

class RefreshTokenResponse extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String tokenType;

  const RefreshTokenResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>
      RefreshTokenResponse(
        accessToken: json['access_token'] ?? '',
        refreshToken: json['refresh_token'] ?? '',
        tokenType: json['token_type'] ?? 'bearer',
      );

  @override
  List<Object> get props => [accessToken, refreshToken, tokenType];
}

