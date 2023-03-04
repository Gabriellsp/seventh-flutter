import 'package:seventh_prova_flutter/app/core/auth/auth_client.dart/auth_client.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';

class LoginRepository {
  final AuthClient client;
  LoginRepository(this.client);

  Future<void> login(LoginModel login) async {
    var aux = LoginModel(username: "candidato-seventh", password: "8n5zSrYq");
    await client.login(aux);
  }

  Future<bool> userHasToken() async {
    final userToken = await client.loadTokenFromCache();
    if (userToken.token!.isEmpty) {
      return false;
    }
    return true;
  }
}
