import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:seventh_prova_flutter/app/features/login/login_repository.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';
import 'package:seventh_prova_flutter/app/shared/routes/app_routes.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginRepository repository;
  LoginStoreBase(this.repository);

  @observable
  String _userName = "";

  @observable
  String _password = "";

  String get password => _password;

  String get userName => _userName;

  @action
  void setUserName(String value) {
    _userName = value;
  }

  @action
  void setPassword(String value) {
    _password = value;
  }

  @action
  Future<void> login() async {
    final credential = LoginModel(
      username: userName,
      password: password,
    );
    // final token = await repository.login(credential);
    Modular.to.pushNamedAndRemoveUntil(AppRoutes.home, (p0) => false);
  }
}
