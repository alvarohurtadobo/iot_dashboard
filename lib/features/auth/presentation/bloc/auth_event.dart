import 'package:equatable/equatable.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';

/// Eventos del AuthBloc
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Evento para solicitar login
class LoginRequested extends AuthEvent {
  final AuthCredentials credentials;

  const LoginRequested(this.credentials);

  @override
  List<Object> get props => [credentials];
}

/// Evento para solicitar logout
class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

/// Evento para verificar el estado de autenticación
class AuthStatusChecked extends AuthEvent {
  const AuthStatusChecked();
}

