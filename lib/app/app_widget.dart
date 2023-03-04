import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_button_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_input_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_progress_indicator_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_snackbar_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_text_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Seventh',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        primarySwatch: AppColor.primaryColor,
        snackBarTheme: const AppSnackbarTheme(),
        textTheme: const AppTextTheme(),
        elevatedButtonTheme: AppButtonTheme(),
        inputDecorationTheme: AppInputTheme(),
        progressIndicatorTheme: const AppProgressIndicatorTheme(),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
