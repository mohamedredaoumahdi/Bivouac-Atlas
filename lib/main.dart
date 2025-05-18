import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/onboarding_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(const BivouacAtlasApp());
}

class BivouacAtlasApp extends StatefulWidget {
  const BivouacAtlasApp({super.key});

  @override
  State<BivouacAtlasApp> createState() => _BivouacAtlasAppState();

  static _BivouacAtlasAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_BivouacAtlasAppState>();
}

class _BivouacAtlasAppState extends State<BivouacAtlasApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bivouac Atlas',
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      theme: _buildTheme(),
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildTheme() {
    return ThemeData(
      // Custom Color Scheme
      primarySwatch: _createMaterialColor(const Color(0xFF4CAF50)),
      primaryColor: const Color(0xFF4CAF50), // Natural Green
      scaffoldBackgroundColor: const Color(0xFFFFFFFF), // Clean White
      fontFamily: 'Montserrat',
      
      // Custom Color Scheme
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF4CAF50), // Natural Green
        secondary: Color(0xFF795548), // Earth Brown
        surface: Color(0xFFF5F5DC), // Warm Beige
        background: Color(0xFFFFFFFF), // Clean White
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF333333), // Dark Charcoal
        onBackground: Color(0xFF333333), // Dark Charcoal
        error: Color(0xFFE57373), // Soft Red
      ),
      
      // AppBar Theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF4CAF50), // Natural Green
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      
      // Card Theme
      cardTheme: CardTheme(
        elevation: 4,
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF388E3C), // Forest Green (CTA)
          foregroundColor: Colors.white,
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Text Button Theme
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: const Color(0xFF4CAF50), // Natural Green
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: const Color(0xFF4CAF50), // Natural Green
          side: const BorderSide(color: Color(0xFF4CAF50), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF757575)), // Cool Gray
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF757575)), // Cool Gray
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFF4CAF50), width: 2), // Natural Green
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE57373)), // Soft Red
        ),
        labelStyle: const TextStyle(color: Color(0xFF757575)), // Cool Gray
        hintStyle: const TextStyle(color: Color(0xFF757575)), // Cool Gray
        prefixIconColor: const Color(0xFF4CAF50), // Natural Green
      ),
      
      // Text Theme
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        bodyMedium: TextStyle(
          color: Color(0xFF333333), // Dark Charcoal
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          color: Color(0xFF757575), // Cool Gray
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
      
      // SnackBar Theme
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Color(0xFF795548), // Earth Brown
        contentTextStyle: TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
        ),
      ),
      
      // Chip Theme
      chipTheme: ChipThemeData(
        backgroundColor: const Color(0xFFF5F5DC), // Warm Beige
        selectedColor: const Color(0xFF4CAF50), // Natural Green
        labelStyle: const TextStyle(color: Color(0xFF333333)), // Dark Charcoal
        secondaryLabelStyle: const TextStyle(color: Colors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      
      // Floating Action Button Theme
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF388E3C), // Forest Green
        foregroundColor: Colors.white,
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF4CAF50), // Natural Green
        unselectedItemColor: Color(0xFF757575), // Cool Gray
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  // Helper method to create MaterialColor from Color
  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (double strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}