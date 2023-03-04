import 'package:flutter/material.dart';

class AppButtonTheme extends ElevatedButtonThemeData {
  AppButtonTheme()
      : super(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        );
}
