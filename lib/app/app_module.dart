import 'package:flutter_modular/flutter_modular.dart';
import 'package:seventh_prova_flutter/app/features/login/login_module.dart';
import 'package:seventh_prova_flutter/app/shared/routes/app_routes.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        // Bind.singleton((i) => RadioPlayerStore(i())),
        // Bind.singleton((i) => RadioPlayerRepository(Client())),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(AppRoutes.initial, module: LoginModule()),
        // ModuleRoute(AppRoutes.home, module: HomeModule()),
      ];
}
