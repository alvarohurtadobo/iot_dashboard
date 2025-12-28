import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;
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

  /// Detects if the app is running on desktop (Windows, macOS, Linux)
  bool _isDesktop() {
    if (kIsWeb) return false; // Web is not considered desktop for minimizable sidebar
    return defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        defaultTargetPlatform == TargetPlatform.linux;
  }

  @override
  Widget build(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 900;
    final isDesktop = _isDesktop();

    // On desktop, always show minimizable sidebar
    // On web/large tablet, also allow minimizing
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
      // Mobile/Small Tablet: Drawer
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

