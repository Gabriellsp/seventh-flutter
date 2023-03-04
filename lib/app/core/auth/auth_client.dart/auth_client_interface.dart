import 'package:seventh_prova_flutter/app/models/login_model.dart';
import 'package:seventh_prova_flutter/app/models/token_model.dart';

abstract class AuthClientInterface {
  Future<void> login(LoginModel login);
  Future<TokenModel> loadTokenFromCache();
}
