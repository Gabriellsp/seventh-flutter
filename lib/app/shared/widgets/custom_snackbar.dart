import 'package:flutter/material.dart';

class CustomSnackbar extends SnackBar {
  final String message;
  CustomSnackbar({super.key, required this.message})
      : super(
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        );
}
