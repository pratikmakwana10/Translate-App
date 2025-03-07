import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('demo_translate').tr(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100), // Spacing
              // Dropdown for selecting language
              DropdownButton<Locale>(
                onChanged: (Locale? newValue) {
                  if (newValue != null) {
                    context.setLocale(newValue);
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: Locale('en'),
                    child: Text('English'),
                  ),
                  DropdownMenuItem(
                    value: Locale('es'),
                    child: Text('Spanish'),
                  ),
                  DropdownMenuItem(
                    value: Locale('hi'),
                    child: Text('Hindi'),
                  ),
                  DropdownMenuItem(
                    value: Locale('gu'),
                    child: Text('Gujarati'),
                  ),
                ],
                hint: const Text('Select Language'), // Hint text
              ),

              const SizedBox(height: 200), // Spacing
              // Text indicating this is a demo app
              const Text(
                'This is a demo app for translating languages.',
                style: TextStyle(fontSize: 15),
              ).tr(), // Translated text

              const SizedBox(height: 20), // Spacing
              // Login button
              ElevatedButton(
                onPressed: () {
                  // Add your login functionality here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged In')),
                  );
                },
                child: const Text('Login').tr(),
              ),

              const SizedBox(height: 10), // Spacing

              // Logout button
              ElevatedButton(
                onPressed: () {
                  // Add your logout functionality here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Logged Out')),
                  );
                },
                child: const Text('Logout').tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
