import 'package:flutter/material.dart';

class AppColor {
  static const Map<int, Color> primaryRed = {
    50: Color.fromRGBO(0, 0, 255, 0.1),
    100: Color.fromRGBO(0, 0, 255, 0.2),
    200: Color.fromRGBO(0, 0, 255, .3),
    300: Color.fromRGBO(0, 0, 255, .4),
    400: Color.fromRGBO(0, 0, 255, .5),
    500: Color.fromRGBO(0, 0, 255, .6),
    600: Color.fromRGBO(0, 0, 255, .7),
    700: Color.fromRGBO(0, 0, 255, .8),
    800: Color.fromRGBO(0, 0, 255, .9),
    900: Color.fromRGBO(0, 0, 255, 1),
  };

  static const MaterialColor primaryColor =
      MaterialColor(0xFF0000FF, primaryRed);
}
