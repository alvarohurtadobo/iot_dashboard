import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_dashboard/core/network/api_exceptions.dart';
import 'package:iot_dashboard/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:iot_dashboard/features/auth/domain/usecases/login_usecase.dart';
import 'package:iot_dashboard/features/auth/domain/usecases/logout_usecase.dart';
import 'package:iot_dashboard/features/auth/presentation/bloc/auth_event.dart';
import 'package:iot_dashboard/features/auth/presentation/bloc/auth_state.dart';

/// BLoC to handle authentication state
/// Uses UseCases instead of accessing the repository directly
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;
  final CheckAuthStatusUseCase checkAuthStatusUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.checkAuthStatusUseCase,
  }) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<AuthStatusChecked>(_onAuthStatusChecked);
    on<GuestLoginRequested>(_onGuestLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await loginUseCase.execute(event.credentials);
      emit(AuthAuthenticated());
    } on ApiException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      emit(AuthError('Unexpected error. Please try again.'));
    }
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await logoutUseCase.execute();
      emit(AuthUnauthenticated());
    } catch (e) {
      // Even if it fails, mark as unauthenticated
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onAuthStatusChecked(
    AuthStatusChecked event,
    Emitter<AuthState> emit,
  ) async {
    final isAuthenticated = await checkAuthStatusUseCase.execute();
    if (isAuthenticated) {
      emit(AuthAuthenticated());
    } else {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> _onGuestLoginRequested(
    GuestLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    // Allow guest access without authentication
    emit(AuthGuest());
  }
}



