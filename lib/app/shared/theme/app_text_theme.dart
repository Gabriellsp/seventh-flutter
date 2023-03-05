import 'package:flutter/material.dart';

class AppTextTheme extends TextTheme {
  const AppTextTheme()
      : super(
          titleLarge: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        );
}
