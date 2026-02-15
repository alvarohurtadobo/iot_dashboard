import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';

/// Domain model for authentication tokens
/// Represents tokens in the application domain
@freezed
class AuthTokens with _$AuthTokens {
  AuthTokens({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
  });
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final String tokenType;
}



