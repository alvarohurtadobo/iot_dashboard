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

  @override
  Widget build(BuildContext context) {
    const colorFoundations = ColorsFoundations();
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth >= 900; // Breakpoint for large screens

    if (isLargeScreen) {
      // Large screen: Sidebar always visible (can be minimized)
      return Scaffold(
        backgroundColor: colorFoundations.backgroundPagePrimary,
        body: Row(
          children: [
            // Sidebar
            Sidebar(
              isExpanded: _isSidebarExpanded,
              onToggle: () {
                setState(() {
                  _isSidebarExpanded = !_isSidebarExpanded;
                });
              },
            ),
            
            // Main content
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      );
    } else {
      // Small screen: Drawer
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.menu),
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

