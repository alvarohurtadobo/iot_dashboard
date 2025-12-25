class ApiConstants {
  static const String baseUrl = 'http://localhost:8000';
  
  // Auth endpoints
  static const String login = '/v1/auth/login';
  static const String logout = '/v1/auth/logout';
  static const String refreshToken = '/v1/auth/refresh';
  static const String health = '/health';
}

