import 'package:go_router/go_router.dart';
import 'package:iot_dashboard/layouts/main_layout.dart';
import 'package:iot_dashboard/pages/dashboard_page.dart';
import 'package:iot_dashboard/pages/company_page.dart';
import 'package:iot_dashboard/pages/machinery_page.dart';
import 'package:iot_dashboard/pages/devices_page.dart';
import 'package:iot_dashboard/pages/reports_page.dart';
import 'package:iot_dashboard/pages/notifications_page.dart';

/// Application routes configuration
class AppRoutes {
  static const String home = '/';
  static const String company = '/company';
  static const String machinery = '/machinery';
  static const String devices = '/devices';
  static const String reports = '/reports';
  static const String notifications = '/notifications';
}

/// Configure GoRouter with all application routes
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.home,
          name: 'home',
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: AppRoutes.company,
          name: 'company',
          builder: (context, state) => const CompanyPage(),
        ),
        GoRoute(
          path: AppRoutes.machinery,
          name: 'machinery',
          builder: (context, state) => const MachineryPage(),
        ),
        GoRoute(
          path: AppRoutes.devices,
          name: 'devices',
          builder: (context, state) => const DevicesPage(),
        ),
        GoRoute(
          path: AppRoutes.reports,
          name: 'reports',
          builder: (context, state) => const ReportsPage(),
        ),
        GoRoute(
          path: AppRoutes.notifications,
          name: 'notifications',
          builder: (context, state) => const NotificationsPage(),
        ),
      ],
    ),
  ],
);

