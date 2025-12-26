import 'package:equatable/equatable.dart';

/// Estados del AuthBloc
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

/// Estado inicial
class AuthInitial extends AuthState {}

/// Estado de carga
class AuthLoading extends AuthState {}

/// Estado autenticado
class AuthAuthenticated extends AuthState {
  const AuthAuthenticated();
}

/// Estado no autenticado
class AuthUnauthenticated extends AuthState {}

/// Estado de error
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

