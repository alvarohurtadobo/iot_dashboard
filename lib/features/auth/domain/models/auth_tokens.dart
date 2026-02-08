import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_tokens.freezed.dart';

/// Domain model for authentication tokens
/// Represents tokens in the application domain
@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
  }) = _AuthTokens;
}



