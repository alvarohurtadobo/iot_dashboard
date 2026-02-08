import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';

/// Domain model for authentication credentials
/// Represents domain data, not API data
@freezed
class AuthCredentials with _$AuthCredentials {
  const factory AuthCredentials({
    required String email,
    required String password,
  }) = _AuthCredentials;
}

