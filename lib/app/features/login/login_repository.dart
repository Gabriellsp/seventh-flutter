import 'package:seventh_prova_flutter/app/core/auth/auth_client.dart/auth_client.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';

class LoginRepository {
  final AuthClient client;
  LoginRepository(this.client);

  Future<void> login(LoginModel login) async {
    await client.login(login);
  }

  Future<bool> userHasToken() async {
    final userToken = await client.loadTokenFromCache();
    if (userToken.token!.isEmpty) {
      return false;
    }
    return true;
  }
}
