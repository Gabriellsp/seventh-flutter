import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:seventh_prova_flutter/app/core/auth/auth_client.dart/auth_client.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/authentication_intercaptor.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/error_inteceptor.dart';
import 'package:seventh_prova_flutter/app/features/home/home_page.dart';
import 'package:seventh_prova_flutter/app/features/login/login_page.dart';
import 'package:seventh_prova_flutter/app/features/login/repository/login_repository.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';
import 'package:seventh_prova_flutter/app/shared/routes/app_routes.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => LoginStore(i())),
        Bind.lazySingleton((i) => LoginRepository(i())),
        Bind.lazySingleton((i) => AuthClient(i())),
        Bind.lazySingleton(
          (i) => InterceptedClient.build(
            interceptors: [
              AutheticationInterceptor(),
              ErrorInterceptor(),
            ],
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AppRoutes.initial,
          child: (_, args) => const LoginPage(),
          transition: TransitionType.noTransition,
        ),
        ChildRoute(
          AppRoutes.home,
          child: (_, args) => const HomePage(),
          transition: TransitionType.noTransition,
        ),
      ];
}
