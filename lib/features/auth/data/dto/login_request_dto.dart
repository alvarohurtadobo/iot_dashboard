import 'package:equatable/equatable.dart';

/// DTO (Data Transfer Object) for login request
/// Represents data as sent to the API
class LoginRequestDto extends Equatable {
  final String email;
  final String password;

  const LoginRequestDto({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  List<Object> get props => [email, password];
}



