
import 'package:flutter/material.dart';

class AppColor {
  static const Map<int, Color> primaryRed = {
    50: Color.fromRGBO(226, 0, 26, .1),
    100: Color.fromRGBO(226, 0, 26, .2),
    200: Color.fromRGBO(226, 0, 26, .3),
    300: Color.fromRGBO(226, 0, 26, .4),
    400: Color.fromRGBO(226, 0, 26, .5),
    500: Color.fromRGBO(226, 0, 26, .6),
    600: Color.fromRGBO(226, 0, 26, .7),
    700: Color.fromRGBO(226, 0, 26, .8),
    800: Color.fromRGBO(226, 0, 26, .9),
    900: Color.fromRGBO(226, 0, 26, 1),
  };

  static const MaterialColor primaryColor =
      MaterialColor(0xFFE2001A, primaryRed);
}