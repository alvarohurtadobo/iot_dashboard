import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_dashboard/common/app_theme.dart';
import 'package:iot_dashboard/core/network/api_client.dart';
import 'package:iot_dashboard/core/storage/token_storage.dart';
import 'package:iot_dashboard/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:iot_dashboard/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:iot_dashboard/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:iot_dashboard/features/auth/domain/usecases/login_usecase.dart';
import 'package:iot_dashboard/features/auth/domain/usecases/logout_usecase.dart';
import 'package:iot_dashboard/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:iot_dashboard/features/auth/presentation/bloc/auth_event.dart';
import 'package:iot_dashboard/router/app_router.dart';

void main() {
  runApp(const IoTDashboardApp());
}

class IoTDashboardApp extends StatelessWidget {
  const IoTDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection - Clean Architecture setup
    // Core Layer
    final tokenStorage = TokenStorage();
    final apiClient = ApiClient(tokenStorage);

    // Data Layer
    final authRemoteDataSource = AuthRemoteDataSourceImpl(apiClient);
    final authRepository = AuthRepositoryImpl(
      remoteDataSource: authRemoteDataSource,
      tokenStorage: tokenStorage,
    );

    // Domain Layer - UseCases
    final loginUseCase = LoginUseCase(authRepository);
    final logoutUseCase = LogoutUseCase(authRepository);
    final checkAuthStatusUseCase = CheckAuthStatusUseCase(authRepository);

    // Presentation Layer - BLoC
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            loginUseCase: loginUseCase,
            logoutUseCase: logoutUseCase,
            checkAuthStatusUseCase: checkAuthStatusUseCase,
          )..add(const AuthStatusChecked()),
        ),
      ],
      child: MaterialApp.router(
        title: 'IoT Dashboard',
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        themeMode: ThemeMode.light,
        routerConfig: appRouter,
      ),
    );
  }
}
