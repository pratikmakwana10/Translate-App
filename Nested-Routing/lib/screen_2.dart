import 'package:flutter/material.dart';

/// Screen2 with a button to navigate to Screen3
class Screen2 extends StatelessWidget {
  final VoidCallback
      onNavigateToSettings; // Callback to navigate to Settings tab

  const Screen2({required this.onNavigateToSettings, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Screen 2'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/screen3'); // Navigate to Screen3
          },
          child: const Text('Go to Screen 3'),
        ),
      ),
    );
  }
}
