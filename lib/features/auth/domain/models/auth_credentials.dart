import 'package:equatable/equatable.dart';

/// Domain model for authentication credentials
/// Represents domain data, not API data
class AuthCredentials extends Equatable {
  final String email;
  final String password;

  const AuthCredentials({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
