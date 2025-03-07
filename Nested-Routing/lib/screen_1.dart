import 'package:flutter/material.dart';

/// A simple screen template with a background color and title
class Screen1 extends StatelessWidget {
  final String title;
  final Color color;

  const Screen1({required this.title, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/screen2'); // Navigate to Screen2
          },
          child: const Text('Go to Screen 2'),
        ),
      ),
    );
  }
}
