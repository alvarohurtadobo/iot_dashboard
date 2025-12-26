import 'package:iot_dashboard/core/storage/token_storage.dart';
import 'package:iot_dashboard/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:iot_dashboard/features/auth/data/dto/logout_request_dto.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_credentials.dart';
import 'package:iot_dashboard/features/auth/domain/models/auth_tokens.dart';
import 'package:iot_dashboard/features/auth/domain/repositories/auth_repository.dart';
import 'package:iot_dashboard/features/auth/data/dto/login_request_dto.dart';

/// Implementación del repositorio de autenticación
/// Convierte entre modelos de dominio y DTOs
/// Orquesta las operaciones entre DataSource y Storage
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final TokenStorage tokenStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.tokenStorage,
  });

  @override
  Future<AuthTokens> login(AuthCredentials credentials) async {
    // Convertir modelo de dominio a DTO
    final requestDto = LoginRequestDto(
      email: credentials.email,
      password: credentials.password,
    );

    // Llamar al DataSource
    final responseDto = await remoteDataSource.login(requestDto);

    // Convertir DTO a modelo de dominio
    final tokens = responseDto.toDomain();

    // Guardar tokens en storage
    await tokenStorage.saveTokens(
      accessToken: tokens.accessToken,
      refreshToken: tokens.refreshToken,
      tokenType: tokens.tokenType,
    );

    return tokens;
  }

  @override
  Future<void> logout() async {
    try {
      final refreshToken = await tokenStorage.getRefreshToken();
      if (refreshToken != null && refreshToken.isNotEmpty) {
        final requestDto = LogoutRequestDto(refreshToken: refreshToken);
        await remoteDataSource.logout(requestDto);
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

