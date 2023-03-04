import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_button_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_input_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_progress_indicator_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_snackbar_theme.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_text_theme.dart';
import 'package:seventh_prova_flutter/app/shared/widgets/custom_snackbar.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    final globalStore = Modular.get<GlobalStore>();

    return Observer(
      builder: (_) {
        if (globalStore.showMessageError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scaffoldKey.currentState!
                .showSnackBar(
                  CustomSnackbar(
                    message: globalStore.messageError,
                  ),
                )
                .closed
                .then((value) => globalStore.setShowMessage(false));
          });
        }

        return MaterialApp.router(
          scaffoldMessengerKey: scaffoldKey,
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
      },
    );
  }
}
