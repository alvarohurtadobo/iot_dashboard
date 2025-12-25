import 'package:equatable/equatable.dart';
import 'package:iot_dashboard/data/models/auth/login_request.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginRequested extends AuthEvent {
  final LoginRequest loginRequest;

  const LoginRequested(this.loginRequest);

  @override
  List<Object> get props => [loginRequest];
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

class AuthStatusChecked extends AuthEvent {
  const AuthStatusChecked();
}

