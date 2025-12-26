import 'package:equatable/equatable.dart';

/// DTO (Data Transfer Object) para el request de login
/// Representa los datos tal como se envían al API
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

