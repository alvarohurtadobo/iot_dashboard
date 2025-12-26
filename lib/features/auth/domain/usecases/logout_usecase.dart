import 'package:iot_dashboard/features/auth/domain/repositories/auth_repository.dart';

/// UseCase para realizar el logout
/// Contiene la lógica de negocio relacionada con cerrar sesión
class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  /// Ejecuta el caso de uso de logout
  Future<void> execute() async {
    await repository.logout();
  }
}

