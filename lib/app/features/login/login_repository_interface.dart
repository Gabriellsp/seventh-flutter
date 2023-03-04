import 'package:seventh_prova_flutter/app/models/login_model.dart';

abstract class LoginRepositoryInterface {
  Future<void> login(LoginModel login);
  Future<bool> userHasToken();
}
