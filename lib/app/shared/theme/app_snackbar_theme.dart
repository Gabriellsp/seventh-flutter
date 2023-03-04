import 'package:flutter/material.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';

class AppSnackbarTheme extends SnackBarThemeData {
  const AppSnackbarTheme()
      : super(
            backgroundColor: AppColor.errorColor,
            actionTextColor: Colors.white);
}
