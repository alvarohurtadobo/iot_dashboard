class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class UnauthorizedException extends ApiException {
  UnauthorizedException([String? message])
      : super(message ?? 'No autorizado', 401);
}

class AccountLockedException extends ApiException {
  AccountLockedException([String? message])
      : super(message ?? 'Cuenta bloqueada. Intenta de nuevo en 30 minutos.', 423);
}

class RateLimitException extends ApiException {
  RateLimitException([String? message])
      : super(message ?? 'Demasiados intentos. Espera un momento.', 429);
}

class NetworkException extends ApiException {
  NetworkException([String? message])
      : super(message ?? 'Error de conexión', null);
}

