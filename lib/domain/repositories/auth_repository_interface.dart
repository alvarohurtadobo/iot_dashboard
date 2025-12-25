import 'package:iot_dashboard/data/models/auth/login_request.dart';
import 'package:iot_dashboard/data/models/auth/login_response.dart';

abstract class AuthRepositoryInterface {
  Future<LoginResponse> login(LoginRequest request);
  Future<void> logout();
  Future<bool> isAuthenticated();
}

