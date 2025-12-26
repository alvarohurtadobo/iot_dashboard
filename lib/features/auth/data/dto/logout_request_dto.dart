import 'package:equatable/equatable.dart';

/// DTO para el request de logout
class LogoutRequestDto extends Equatable {
  final String refreshToken;

  const LogoutRequestDto({required this.refreshToken});

  Map<String, dynamic> toJson() => {
        'refresh_token': refreshToken,
      };

  @override
  List<Object> get props => [refreshToken];
}

