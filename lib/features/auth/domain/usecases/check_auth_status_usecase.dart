import 'package:iot_dashboard/features/auth/domain/repositories/auth_repository.dart';

/// UseCase to check authentication status
class CheckAuthStatusUseCase {
  final AuthRepository repository;

  CheckAuthStatusUseCase(this.repository);

  /// Executes the authentication status check
  Future<bool> execute() async {
    return await repository.isAuthenticated();
  }
}



