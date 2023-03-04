import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:seventh_prova_flutter/app/features/login/login_repository_interface.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';
import 'package:seventh_prova_flutter/app/shared/routes/app_routes.dart';
import 'package:seventh_prova_flutter/app/util/enum/http_error.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final LoginRepositoryInterface repository;
  LoginStoreBase(this.repository);

  @observable
  bool _isLoading = false;

  @observable
  String _userName = "";

  @observable
  String _password = "";

  @observable
  String _messageError = "";

  @observable
  bool _showMessageError = false;

  bool get isLoading => _isLoading;

  String get password => _password;

  String get userName => _userName;

  String get messageError => _messageError;

  bool get showMessageError => _showMessageError;

  @action
  void setIsLoading(bool value) {
    _isLoading = value;
  }

  @action
  void setUserName(String value) {
    _userName = value;
  }

  @action
  void setPassword(String value) {
    _password = value;
  }

  @action
  void setShowMessage(bool value) {
    _showMessageError = value;
  }

  @action
  void setMessageError(String value) {
    _showMessageError = true;
    _messageError = value;
  }

  @action
  Future<void> login() async {
    final credential = LoginModel(
      username: userName,
      password: password,
    );
    setIsLoading(true);
    try {
      await repository.login(credential);
      Modular.to.pushNamedAndRemoveUntil(AppRoutes.home, (p0) => false);
    } on HttpError catch (error) {
      switch (error) {
        case HttpError.unauthorized:
          setMessageError("Usuario e/ou senha inválida! Tente novamente...");
          break;
        default:
          setMessageError("Error inesperado, tente novamente mais tarde!");
          break;
      }
    }
    setIsLoading(false);
  }

  @action
  Future<void> verifyUserHasToken() async {
    if (await repository.userHasToken()) {
      Modular.to.pushNamedAndRemoveUntil(AppRoutes.home, (p0) => false);
    }
  }
}
