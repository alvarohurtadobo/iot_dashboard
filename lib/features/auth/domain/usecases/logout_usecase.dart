import 'package:iot_dashboard/features/auth/domain/repositories/auth_repository.dart';

/// UseCase to perform logout
/// Contains business logic related to closing session
class LogoutUseCase {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  /// Executes the logout use case
  Future<void> execute() async {
    await repository.logout();
  }
}



