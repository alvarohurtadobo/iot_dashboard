import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_tokens.dart';

/// Interface del repositorio de autenticación en Domain Layer
/// Define el contrato sin depender de implementaciones concretas
abstract class AuthRepository {
  /// Realiza el login y retorna los tokens
  Future<AuthTokens> login(AuthCredentials credentials);

  /// Cierra la sesión del usuario
  Future<void> logout();

  /// Verifica si el usuario está autenticado
  Future<bool> isAuthenticated();
}

