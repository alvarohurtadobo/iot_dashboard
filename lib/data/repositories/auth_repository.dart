import 'package:iot_dashboard/core/storage/token_storage.dart';
import 'package:iot_dashboard/data/datasources/auth_remote_datasource.dart';
import 'package:iot_dashboard/data/models/auth/login_request.dart';
import 'package:iot_dashboard/data/models/auth/login_response.dart';
import 'package:iot_dashboard/data/models/auth/logout_request.dart';
import 'package:iot_dashboard/domain/repositories/auth_repository_interface.dart';

class AuthRepository implements AuthRepositoryInterface {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;

  AuthRepository({
    required this.remoteDataSource,
    required this.tokenStorage,
  });

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await remoteDataSource.login(request);

      // Guardar tokens
      await tokenStorage.saveTokens(
        accessToken: response.accessToken,
        refreshToken: response.refreshToken,
        tokenType: response.tokenType,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      final refreshToken = await tokenStorage.getRefreshToken();
      if (refreshToken != null && refreshToken.isNotEmpty) {
        await remoteDataSource.logout(
          LogoutRequest(refreshToken: refreshToken),
        );
      }
    } catch (e) {
      // Continuar con logout local incluso si falla el servidor
    } finally {
      await tokenStorage.clearTokens();
    }
  }

  @override
  Future<bool> isAuthenticated() async {
    return await tokenStorage.hasToken();
  }
}

