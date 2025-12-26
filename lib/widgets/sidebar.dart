import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iot_dashboard/common/constants/colors.dart';
import 'package:iot_dashboard/common/constants/sizes.dart';
import 'package:iot_dashboard/router/app_router.dart';

class Sidebar extends StatelessWidget {
  final bool isExpanded;
  final bool isDrawer;
  final VoidCallback onToggle;

  const Sidebar({
    super.key,
    required this.isExpanded,
    this.isDrawer = false,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorFoundations = ColorsFoundations();
    final currentRoute = GoRouterState.of(context).uri.path;

    final menuItems = [
      _MenuItem(
        title: 'Home',
        icon: Icons.home_outlined,
        activeIcon: Icons.home,
        route: AppRoutes.dashboard,
      ),
      _MenuItem(
        title: 'Empresa',
        icon: Icons.business_outlined,
        activeIcon: Icons.business,
        route: AppRoutes.company,
      ),
      _MenuItem(
        title: 'Maquinaria',
        icon: Icons.precision_manufacturing_outlined,
        activeIcon: Icons.precision_manufacturing,
        route: AppRoutes.machinery,
      ),
      _MenuItem(
        title: 'Dispositivos',
        icon: Icons.devices_outlined,
        activeIcon: Icons.devices,
        route: AppRoutes.devices,
      ),
      _MenuItem(
        title: 'Reportes',
        icon: Icons.assessment_outlined,
        activeIcon: Icons.assessment,
        route: AppRoutes.reports,
      ),
      _MenuItem(
        title: 'Notificaciones',
        icon: Icons.notifications_outlined,
        activeIcon: Icons.notifications,
        route: AppRoutes.notifications,
      ),
      _MenuItem(
        title: 'Salir',
        icon: Icons.logout_outlined,
        activeIcon: Icons.logout,
        route: null,
        isLogout: true,
      ),
    ];

    Widget sidebarContent = Container(
      width: isExpanded ? 280 : 80,
      decoration: BoxDecoration(
        color: colorFoundations.backgroundComponentPrimary,
        border: Border(
          right: BorderSide(
            color: colorFoundations.borderPrimary,
            width: AppSizes.size1,
          ),
        ),
      ),
      child: Column(
        children: [
          // User Profile Section
          _buildUserProfile(context),
          
          const Divider(height: 1),
          
          // Menu Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: AppSizes.sizeXs),
              children: [
                ...menuItems.map((item) {
                  final isActive = currentRoute == item.route;
                  return _buildMenuItem(
                    context,
                    item: item,
                    isActive: isActive,
                  );
                }),
                // Minimize/Expand button (only on large screens, not drawer)
                if (!isDrawer) ...[
                  Divider(),
                  ListTile(
                    leading: Icon(
                      isExpanded ? Icons.chevron_left : Icons.chevron_right,
                      color: colorFoundations.textTertiary,
                    ),
                    title: isExpanded
                        ? Text(
                            'Minimizar',
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        : null,
                    onTap: onToggle,
                  ),
                ],
              ],
            ),
          ),
          
          // Version
          _buildVersionSection(context),
        ],
      ),
    );

    if (isDrawer) {
      return Drawer(
        child: sidebarContent,
      );
    }

    return sidebarContent;
  }

  Widget _buildUserProfile(BuildContext context) {
    final colorFoundations = ColorsFoundations();
    
    return Container(
      padding: EdgeInsets.all(isExpanded ? AppSizes.sizeMd : AppSizes.sizeXs),
      child: Column(
        children: [
          // Avatar
          CircleAvatar(
            radius: isExpanded ? AppSizes.size28 : AppSizes.size20,
            backgroundColor: colorFoundations.interactionPrimary,
            child: Text(
              'JD',
              style: TextStyle(
                color: colorFoundations.textSecondary,
                fontSize: isExpanded ? AppSizes.size20 : AppSizes.size14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          if (isExpanded) ...[
            SizedBox(height: AppSizes.sizeXs),
            Text(
              'Juan Díaz',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSizes.size4),
            Text(
              'juan.diaz@empresa.com',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorFoundations.textTertiary,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required _MenuItem item,
    required bool isActive,
  }) {
    final colorFoundations = ColorsFoundations();
    
    final icon = isActive ? item.activeIcon : item.icon;
    
    Widget menuItem = ListTile(
      leading: Icon(
        icon,
        color: isActive
            ? colorFoundations.interactionPrimary
            : colorFoundations.textTertiary,
        size: AppSizes.size24,
      ),
      title: isExpanded
          ? Text(
              item.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isActive
                    ? colorFoundations.interactionPrimary
                    : colorFoundations.textPrimary,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              ),
            )
          : null,
      selected: isActive,
      selectedTileColor: colorFoundations.interactionTertiary,
      onTap: () {
        if (item.isLogout) {
          // Handle logout
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Función de salir no implementada')),
          );
        } else if (item.route != null) {
          if (isDrawer) {
            onToggle(); // Close drawer
          }
          context.go(item.route!);
        }
      },
    );

    return menuItem;
  }

  Widget _buildVersionSection(BuildContext context) {
    final colorFoundations = ColorsFoundations();
    
    return Container(
      padding: EdgeInsets.all(AppSizes.sizeXs),
      child: Column(
        children: [
          Divider(),
          SizedBox(height: AppSizes.size2Xs),
          Text(
            isExpanded ? 'Versión 1.0.0' : 'v1.0.0',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: colorFoundations.textTertiary,
              fontSize: AppSizes.size10,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.size2Xs),
        ],
      ),
    );
  }
}

class _MenuItem {
  final String title;
  final IconData icon;
  final IconData activeIcon;
  final String? route;
  final bool isLogout;

  _MenuItem({
    required this.title,
    required this.icon,
    required this.activeIcon,
    this.route,
    this.isLogout = false,
  });
}

