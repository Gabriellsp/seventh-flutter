import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/home/home_repository.dart';
import 'package:seventh_prova_flutter/app/features/home/home_store.dart';

import 'package:seventh_prova_flutter/app/core/http/http_client.dart';
import 'package:http_interceptor/http_interceptor.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeStore(i())),
        Bind.lazySingleton((i) => HomeRepository(i())),
        Bind.lazySingleton((i) => HttpClient(i())),
        Bind.lazySingleton(
          (i) => InterceptedClient.build(
            interceptors: [],
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [];
}
