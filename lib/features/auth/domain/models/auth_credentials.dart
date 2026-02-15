import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_credentials.freezed.dart';

/// Domain model for authentication credentials
/// Represents domain data, not API data
@freezed
class AuthCredentials with _$AuthCredentials {
  AuthCredentials({required this.email, required this.password});
  @override
  final String email;
  @override
  final String password;
}
