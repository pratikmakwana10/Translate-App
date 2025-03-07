import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'home.dart'; // Import your Home widget

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
        Locale('gu'), // Gujrati
        Locale('hi'), // Hindi
      ],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations', // Path to the translation files
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localization Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(), // Set the Home widget as the home screen
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale, // Use the current locale
      debugShowCheckedModeBanner: false, // Optional: Hide the debug banner
    );
  }
}
