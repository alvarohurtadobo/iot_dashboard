import 'package:iot_dashboard/core/network/api_exceptions.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';
import 'package:iot_dashboard/features/auth/domain/repositories/auth_repository.dart';

/// UseCase para realizar el login
/// Contiene la lógica de negocio relacionada con la autenticación
class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  /// Ejecuta el caso de uso de login
  /// 
  /// Retorna [AuthTokens] si el login es exitoso
  /// Lanza [ApiException] si hay un error
  Future<AuthTokens> execute(AuthCredentials credentials) async {
    // Validación de negocio (si fuera necesaria)
    if (credentials.email.isEmpty || credentials.password.isEmpty) {
      throw const ApiException('Email y contraseña son requeridos');
    }

    // Delegar al repositorio
    return await repository.login(credentials);
  }
}

