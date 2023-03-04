import 'package:seventh_prova_flutter/app/core/auth/auth_client.dart/auth_client.dart';
import 'package:seventh_prova_flutter/app/features/login/repository/login_repository_interface.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';

class LoginRepository implements LoginRepositoryInterface {
  final AuthClient client;
  LoginRepository(this.client);

  @override
  Future<void> login(LoginModel login) async {
    var aux = LoginModel(username: "candidato-seventh", password: "8n5zSrYq");
    await client.login(aux);
  }

  @override
  Future<bool> userHasToken() async {
    final userToken = await client.loadTokenFromCache();
    if (userToken.token!.isEmpty) {
      return false;
    }
    return true;
  }
}
