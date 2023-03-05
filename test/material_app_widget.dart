import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';
import 'package:seventh_prova_flutter/app/shared/theme/theme.dart';
import 'package:seventh_prova_flutter/app/shared/widgets/custom_snackbar.dart';

class MaterialAppWidget extends StatelessWidget {
  final GlobalStore globalStore;
  final Widget child;
  const MaterialAppWidget(
      {required this.globalStore, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldMessengerState> scaffoldKey =
        GlobalKey<ScaffoldMessengerState>();

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

        return MaterialApp(
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
          home: child,
        );
      },
    );
  }
}
