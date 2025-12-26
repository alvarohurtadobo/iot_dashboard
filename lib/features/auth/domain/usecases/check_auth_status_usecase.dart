import 'package:iot_dashboard/features/auth/domain/repositories/auth_repository.dart';

/// UseCase para verificar el estado de autenticación
class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  /// Ejecuta la verificación del estado de autenticación
  Future<bool> execute() async {
    return await repository.isAuthenticated();
  }
}

