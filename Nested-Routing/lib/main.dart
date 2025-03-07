import 'package:flutter/material.dart';
import 'package:index_stack/main_screen.dart';

void main() {
  runApp(const MyApp()); // Root of the application
}

/// Main Application Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Nested Routes Example',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const MainScreen(), // The main screen with bottom navigation
    );
  }
}
