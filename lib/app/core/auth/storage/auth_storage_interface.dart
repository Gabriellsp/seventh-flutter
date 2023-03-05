import 'package:seventh_prova_flutter/app/models/token_model.dart';

abstract class AuthStorageInterface {
  Future<void> saveTokenToStorage(TokenModel? token);
  Future<TokenModel> getTokenFromStorage();
  Future clearToken();
}
