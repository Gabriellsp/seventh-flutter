import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/authentication_intercaptor.dart';
import 'package:seventh_prova_flutter/app/core/interceptors/error_inteceptor.dart';
import 'package:seventh_prova_flutter/app/features/home/home_page.dart';
import 'package:seventh_prova_flutter/app/features/home/repository/home_repository.dart';
import 'package:seventh_prova_flutter/app/features/home/home_store.dart';

import 'package:seventh_prova_flutter/app/core/http/http_client.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<HomeStore>((i) => HomeStore(i())),
        Bind.lazySingleton<HomeRepository>((i) => HomeRepository(i())),
        Bind.lazySingleton<HttpClient>((i) => HttpClient(i())),
        Bind.lazySingleton<InterceptedClient>(
          (i) => InterceptedClient.build(
            interceptors: [
              AutheticationInterceptor(i()),
              ErrorInterceptor(Modular.get<GlobalStore>()),
            ],
          ),
        ),
        Bind.lazySingleton<AuthStorage>((i) => AuthStorage.instance),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (_, args) => const HomePage(),
            transition: TransitionType.noTransition),
      ];
}
