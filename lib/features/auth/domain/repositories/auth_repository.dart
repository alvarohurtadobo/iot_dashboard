import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_tokens.dart';

/// Authentication repository interface in Domain Layer
/// Defines the contract without depending on concrete implementations
abstract class AuthRepository {
  /// Performs login and returns tokens
  Future<AuthTokens> login(AuthCredentials credentials);

  /// Closes the user session
  Future<void> logout();

  /// Checks if the user is authenticated
  Future<bool> isAuthenticated();
}



