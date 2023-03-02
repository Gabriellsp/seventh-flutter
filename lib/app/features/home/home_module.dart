import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:seventh_prova_flutter/app/features/home/home_repository.dart';
import 'package:seventh_prova_flutter/app/features/home/home_store.dart';
import 'package:seventh_prova_flutter/app/features/login/login_page.dart';
import 'package:seventh_prova_flutter/app/features/login/login_repository.dart';
import 'package:seventh_prova_flutter/app/features/login/login_store.dart';
import 'package:seventh_prova_flutter/app/infra/http/http_client.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeStore(i())),
        Bind.lazySingleton((i) => HomeRepository(i())),
        Bind.lazySingleton((i) => HttpClient(i())),
        Bind.lazySingleton((i) => Client()),
      ];

  @override
  List<ModularRoute> get routes => [];
}
