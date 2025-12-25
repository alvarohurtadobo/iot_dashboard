import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_dashboard/common/app_theme.dart';
import 'package:iot_dashboard/core/network/api_client.dart';
import 'package:iot_dashboard/core/storage/token_storage.dart';
import 'package:iot_dashboard/data/datasources/auth_remote_datasource.dart';
import 'package:iot_dashboard/data/repositories/auth_repository.dart';
import 'package:iot_dashboard/domain/bloc/auth/auth_bloc.dart';
import 'package:iot_dashboard/domain/bloc/auth/auth_event.dart';
import 'package:iot_dashboard/router/app_router.dart';

void main() {
  runApp(const IoTDashboardApp());
}

class IoTDashboardApp extends StatelessWidget {
  const IoTDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency Injection
    final tokenStorage = TokenStorage();
    final apiClient = ApiClient(tokenStorage);
    final authRemoteDataSource = AuthRemoteDataSource(apiClient);
    final authRepository = AuthRepository(
      remoteDataSource: authRemoteDataSource,
      tokenStorage: tokenStorage,
    );

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authRepository)
            ..add(const AuthStatusChecked()),
        ),
      ],
      child: MaterialApp.router(
        title: 'IoT Dashboard',
        theme: createLightTheme(),
        darkTheme: createDarkTheme(),
        themeMode: ThemeMode.light,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
