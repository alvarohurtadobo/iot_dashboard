import 'package:iot_dashboard/core/network/api_exceptions.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_tokens.dart';
import 'package:iot_dashboard/features/auth/domain/repositories/auth_repository.dart';

/// UseCase to perform login
/// Contains business logic related to authentication
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  /// Executes the login use case
  /// 
  /// Returns [AuthTokens] if login is successful
  /// Throws [ApiException] if there is an error
  Future<AuthTokens> execute(AuthCredentials credentials) async {
    // Business validation (if needed)
    if (credentials.email.isEmpty || credentials.password.isEmpty) {
      throw ApiException('Email and password are required');
    }

    // Delegate to repository
    return await repository.login(credentials);
  }
}

