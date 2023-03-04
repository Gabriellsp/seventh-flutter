import 'package:flutter/material.dart';

class AppColor {
  static const Map<int, Color> primarySwatch = {
    50: Color.fromRGBO(0, 255, 221, 0.1),
    100: Color.fromRGBO(0, 255, 221, 0.2),
    200: Color.fromRGBO(0, 255, 221, 0.3),
    300: Color.fromRGBO(0, 255, 221, .4),
    400: Color.fromRGBO(0, 255, 221, .5),
    500: Color.fromRGBO(0, 255, 221, .6),
    600: Color.fromRGBO(0, 255, 221, .7),
    700: Color.fromRGBO(0, 255, 221, .8),
    800: Color.fromRGBO(0, 255, 221, .9),
    900: Color.fromRGBO(0, 255, 221, 1),
  };

  static const MaterialColor primaryColor =
      MaterialColor(0xFF00B4FF, primarySwatch);

  static const Color backgroundColor = Color.fromARGB(180, 45, 45, 45);

  static const Color errorColor = Color.fromARGB(255, 180, 0, 0);
}
