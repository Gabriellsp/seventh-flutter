import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/shared/theme/app_color.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Seventh',
      theme: ThemeData(primarySwatch: AppColor.primaryColor),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}