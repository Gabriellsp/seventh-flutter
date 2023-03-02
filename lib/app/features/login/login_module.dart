import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:seventh_prova_flutter/app/features/home/home_page.dart';
import 'package:seventh_prova_flutter/app/features/login/login_page.dart';
import 'package:seventh_prova_flutter/app/features/login/login_repository.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';
import 'package:seventh_prova_flutter/app/infra/http/http_client.dart';
import 'package:seventh_prova_flutter/app/shared/routes/app_routes.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => LoginStore(i())),
        Bind.lazySingleton((i) => LoginRepository(i())),
        Bind.lazySingleton((i) => HttpClient(i())),
        Bind.lazySingleton((i) => Client()),
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
