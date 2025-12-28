import 'package:equatable/equatable.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';

/// AuthBloc events
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// Event to request login
class LoginRequested extends AuthEvent {
  final AuthCredentials credentials;

  const LoginRequested(this.credentials);

  @override
  List<Object> get props => [credentials];
}

/// Event to request logout
class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

/// Event to check authentication status
class AuthStatusChecked extends AuthEvent {
  const AuthStatusChecked();
}



