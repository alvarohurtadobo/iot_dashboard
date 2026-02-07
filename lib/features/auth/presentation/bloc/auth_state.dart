import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// AuthBloc states using Freezed for union types
@freezed
class AuthState with _$AuthState {
  /// Initial state
  const factory AuthState.initial() = _Initial;
  
  /// Loading state
  const factory AuthState.loading() = _Loading;
  
  /// Authenticated state
  const factory AuthState.authenticated() = _Authenticated;
  
  /// Unauthenticated state
  const factory AuthState.unauthenticated() = _Unauthenticated;
  
  /// Error state with error message
  const factory AuthState.error(String message) = _Error;
  
  /// Guest state (access without authentication)
  const factory AuthState.guest() = _Guest;
}



