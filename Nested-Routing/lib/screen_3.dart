import 'package:flutter/material.dart';

/// Screen3 with a button to switch to the Settings tab
class Screen3 extends StatelessWidget {
  final VoidCallback
      onNavigateToSettings; // Callback to navigate to Settings tab

  const Screen3({required this.onNavigateToSettings, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Screen 3'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onNavigateToSettings, // Trigger navigation to Settings
          child: const Text('Go to Settings Tab'),
        ),
      ),
    );
  }
}
