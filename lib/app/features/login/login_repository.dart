import 'dart:convert';

import 'package:http/http.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';
import 'package:seventh_prova_flutter/app/models/token.dart';

class LoginRepository {
  final Client client;
  final String host = "mobiletest.seventh.com.br";
  LoginRepository(this.client);

  Future<Token> login(LoginModel login) async {
    final uri = Uri(
      host: host,
      path: 'login',
      scheme: "http",
    );
    try {
      final result = await client.post(
        uri,
        headers: login.toJson(),
      );
      return Token.fromJson(jsonDecode(result.body));
    } on Exception catch (e) {
      throw Exception("Erro ao efetuar login, verifique suas credenciais");
    }
  }
}
