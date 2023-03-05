import 'package:seventh_prova_flutter/app/core/auth/auth_client.dart/auth_client_interface.dart';
import 'package:seventh_prova_flutter/app/features/login/repository/login_repository_interface.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';

class LoginRepository implements LoginRepositoryInterface {
  final AuthClientInterface client;
  LoginRepository(this.client);

  @override
  Future<void> login(LoginModel login) async {
    await client.login(login);
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
