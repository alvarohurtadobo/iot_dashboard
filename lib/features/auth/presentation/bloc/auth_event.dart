import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';

part 'auth_event.freezed.dart';

/// AuthBloc events using Freezed for union types
@freezed
class AuthEvent with _$AuthEvent {
  /// Event to request login
  const factory AuthEvent.loginRequested(AuthCredentials credentials) = _LoginRequested;
  
  /// Event to request logout
  const factory AuthEvent.logoutRequested() = _LogoutRequested;
  
  /// Event to check authentication status
  const factory AuthEvent.authStatusChecked() = _AuthStatusChecked;
  
  /// Event to login as guest
  const factory AuthEvent.guestLoginRequested() = _GuestLoginRequested;
}



