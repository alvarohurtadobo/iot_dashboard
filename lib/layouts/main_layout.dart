import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:iot_dashboard/widgets/sidebar.dart';
import 'package:iot_dashboard/common/constants/colors.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({
    super.key,
    required this.child,
  });

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  bool _isSidebarExpanded = true;

  /// Detecta si la app está corriendo en desktop (Windows, macOS, Linux)
  bool _isDesktop() {
    if (kIsWeb) return false; // Web no se considera desktop para sidebar minimizable
    return Platform.isWindows || Platform.isMacOS || Platform.isLinux;
  }

  @override
  Widget build(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 900;
    final isDesktop = _isDesktop();

    // En desktop, siempre mostrar sidebar minimizable
    // En web/tablet grande, también permitir minimizar
    if (isDesktop || isLargeScreen) {
      return Scaffold(
        backgroundColor: colorFoundations.backgroundPagePrimary,
        body: Row(
          children: [
            // Sidebar minimizable
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              child: Sidebar(
                isExpanded: _isSidebarExpanded,
                onToggle: () {
                  setState(() {
                    _isSidebarExpanded = !_isSidebarExpanded;
                  });
                },
              ),
            ),
            
            // Main content
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      );
    } else {
      // Mobile/Tablet pequeño: Drawer
      return Scaffold(
        backgroundColor: colorFoundations.backgroundPagePrimary,
        drawer: Sidebar(
          isExpanded: true,
          isDrawer: true,
          onToggle: () {
            Navigator.of(context).pop(); // Close drawer
          },
        ),
        body: Builder(
          builder: (context) {
            // Add menu button for mobile
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(child: widget.child),
              ],
            );
          },
        ),
      );
    }
  }
}

