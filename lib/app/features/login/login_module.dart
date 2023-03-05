import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:seventh_prova_flutter/app/core/auth/auth_client.dart/auth_client.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/error_inteceptor.dart';
import 'package:seventh_prova_flutter/app/features/home/home_page.dart';
import 'package:seventh_prova_flutter/app/features/login/login_page.dart';
import 'package:seventh_prova_flutter/app/features/login/repository/login_repository.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';
import 'package:seventh_prova_flutter/app/shared/routes/app_routes.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<LoginStore>((i) => LoginStore(i())),
        Bind.lazySingleton<LoginRepository>((i) => LoginRepository(i())),
        Bind.lazySingleton<AuthClient>((i) => AuthClient(i(), i())),
        Bind.lazySingleton<InterceptedClient>(
          (i) => InterceptedClient.build(
            interceptors: [
              ErrorInterceptor(Modular.get<GlobalStore>()),
            ],
          ),
        ),
        Bind.lazySingleton<AuthStorage>((i) => AuthStorage.instance),
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
