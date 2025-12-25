import 'package:dio/dio.dart';
import 'package:iot_dashboard/core/constants/api_constants.dart';
import 'package:iot_dashboard/core/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final TokenStorage tokenStorage;
  final Dio dio;

  AuthInterceptor(this.tokenStorage, this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // No agregar token a endpoints públicos
    if (options.path == ApiConstants.login || 
        options.path == ApiConstants.refreshToken ||
        options.path == ApiConstants.health) {
      handler.next(options);
      return;
    }

    final token = await tokenStorage.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Si recibimos 401, intentar refrescar el token
    if (err.response?.statusCode == 401 && 
        err.requestOptions.path != ApiConstants.login &&
        err.requestOptions.path != ApiConstants.refreshToken) {
      
      try {
        final refreshed = await _refreshToken();
        if (refreshed) {
          // Reintentar la petición original con el nuevo token
          final token = await tokenStorage.getAccessToken();
          err.requestOptions.headers['Authorization'] = 'Bearer $token';
          
          final response = await dio.fetch(err.requestOptions);
          handler.resolve(response);
          return;
        }
      } catch (e) {
        // Si falla el refresh, limpiar tokens
        await tokenStorage.clearTokens();
      }
    }
    
    handler.next(err);
  }

  Future<bool> _refreshToken() async {
    try {
      final refreshToken = await tokenStorage.getRefreshToken();
      if (refreshToken == null || refreshToken.isEmpty) {
        return false;
      }

      final response = await dio.post(
        ApiConstants.refreshToken,
        data: {'refresh_token': refreshToken},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        await tokenStorage.saveTokens(
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
          tokenType: data['token_type'] ?? 'bearer',
        );
        return true;
      }
    } catch (e) {
      // Error al refrescar
    }
    return false;
  }
}

