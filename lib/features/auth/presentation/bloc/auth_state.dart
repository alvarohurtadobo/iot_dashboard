import 'package:equatable/equatable.dart';

/// AuthBloc states
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

/// Initial state
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Loading state
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Authenticated state
class AuthAuthenticated extends AuthState {
  const AuthAuthenticated();
}

/// Unauthenticated state
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

/// Error state
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object> get props => [message];
}

/// Guest state (access without authentication)
class AuthGuest extends AuthState {
  const AuthGuest();
}



