import 'package:flutter/material.dart';
import 'screens/onboarding_screen.dart';

void main() {
  runApp(const BivouacAtlasApp());
}

class BivouacAtlasApp extends StatelessWidget {
  const BivouacAtlasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bivouac Atlas',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF4CAF50),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4CAF50),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4CAF50),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ),
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}