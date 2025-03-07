import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:index_stack/screen_1.dart';
import 'package:index_stack/screen_2.dart';
import 'package:index_stack/screen_3.dart';

/// MainScreen with Bottom Navigation Bar and Nested Navigators
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // The index of the currently selected tab
  int _selectedIndex = 0;

  // List of GlobalKeys to manage the Navigator state for each tab
  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  /// Creates an [Offstage] Navigator for each tab
  /// Only the currently selected tab will be visible
  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedIndex != index, // Hide when not selected
      child: Navigator(
        key: _navigatorKeys[index], // Use the corresponding key
        onGenerateRoute: (RouteSettings settings) {
          // Define routes for each tab
          return MaterialPageRoute(
            builder: (_) {
              switch (settings.name) {
                case '/':
                  return _getRootPageForIndex(index); // Root page per tab
                case '/screen2':
                  return Screen2(onNavigateToSettings: () {
                    setState(() {
                      _selectedIndex = 3; // Navigate to Settings tab
                    });
                  });
                case '/screen3':
                  return Screen3(onNavigateToSettings: () {
                    setState(() {
                      _selectedIndex = 3; // Navigate to Settings tab
                    });
                  });
                default:
                  return _getRootPageForIndex(index);
              }
            },
          );
        },
      ),
    );
  }

  /// Returns the root page for each tab index
  Widget _getRootPageForIndex(int index) {
    switch (index) {
      case 0:
        return const Screen1(title: 'Home Page', color: Colors.red);
      case 1:
        return const Screen1(title: 'Create Page', color: Colors.green);
      case 2:
        return const Screen1(title: 'Profile Page', color: Colors.blue);
      case 3:
        return const Screen1(title: 'Settings Page', color: Colors.orange);
      default:
        return const Screen1(title: 'Home Page', color: Colors.teal);
    }
  }

  /// Handles tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  /// Handles back button presses to navigate within the nested Navigators
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          final isFirstRouteInCurrentTab =
              !(await _navigatorKeys[_selectedIndex].currentState?.maybePop() ??
                  false);
          if (isFirstRouteInCurrentTab) {
            // Exit the app if no routes are left to pop
            return;
          }
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _selectedIndex, // Show the current tab only
          children: List.generate(
            4, // Number of tabs
            (index) => _buildOffstageNavigator(index),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color.fromARGB(
              255, 255, 255, 255), // Background behind navigation bar
          color: Colors.blueAccent, // Color of the navigation bar
          buttonBackgroundColor:
              Colors.blue.shade800, // Active tab button color
          animationDuration: const Duration(milliseconds: 300),
          index: _selectedIndex, // Current tab index
          items: const <Widget>[
            // Icons for navigation bar
            Icon(Icons.home, size: 30, color: Colors.white),
            Icon(Icons.add_circle, size: 30, color: Colors.white),
            Icon(Icons.person, size: 30, color: Colors.white),
            Icon(Icons.settings, size: 30, color: Colors.white),
          ],
          onTap: _onItemTapped, // Handle tab selection
        ),
      ),
    );
  }
}
