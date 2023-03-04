import 'package:flutter/material.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';

class AppInputTheme extends InputDecorationTheme {
  AppInputTheme()
      : super(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          filled: true,
          fillColor: Colors.white,
          iconColor: Colors.white,
          floatingLabelStyle: const TextStyle(
            color: AppColor.primaryColor,
            fontWeight: FontWeight.bold,
          ),
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        );
}
