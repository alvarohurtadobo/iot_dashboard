import 'package:equatable/equatable.dart';

class LogoutRequest extends Equatable {
  final String refreshToken;

  const LogoutRequest({required this.refreshToken});

  Map<String, dynamic> toJson() => {
        'refresh_token': refreshToken,
      };

  @override
  List<Object> get props => [refreshToken];
}

