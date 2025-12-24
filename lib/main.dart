import 'package:flutter/material.dart';
import 'package:iot_dashboard/common/app_theme.dart';
import 'package:iot_dashboard/router/app_router.dart';

void main() {
  runApp(const IoTDashboardApp());
}

class IoTDashboardApp extends StatelessWidget {
  const IoTDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IoT Dashboard',
      theme: createLightTheme(),
      darkTheme: createDarkTheme(),
      themeMode: ThemeMode.light,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
