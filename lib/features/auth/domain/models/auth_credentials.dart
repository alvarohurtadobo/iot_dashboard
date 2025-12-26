import 'package:equatable/equatable.dart';

/// Domain model para credenciales de autenticación
/// Representa los datos del dominio, no los datos de la API
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

