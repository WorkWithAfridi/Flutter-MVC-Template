import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      ).titleLarge,
    ),
    textTheme: _buildTextTheme(lightMode: true), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
    // Add other light mode configurations
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      color: Colors.teal,
      iconTheme: const IconThemeData(color: Colors.white),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      ).titleLarge,
    ),
    textTheme: _buildTextTheme(lightMode: false), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.amber),
    // Add other dark mode configurations
  );

  static TextTheme _buildTextTheme({required bool lightMode}) {
    return TextTheme(
      displayLarge: TextStyle(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      displayMedium: TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      displaySmall: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      headlineMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      labelLarge: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25,
        color: Colors.white,
        fontFamily: 'FuturaBk',
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5,
        color: lightMode ? Colors.black : Colors.white,
        fontFamily: 'FuturaBk',
      ),
    );
  }
}
