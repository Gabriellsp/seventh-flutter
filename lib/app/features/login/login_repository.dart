import 'dart:convert';

import 'package:seventh_prova_flutter/app/infra/http/http_client.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';
import 'package:seventh_prova_flutter/app/models/token_model.dart';
import 'package:seventh_prova_flutter/app/util/enum/method_http.dart';

class LoginRepository {
  final HttpClient client;
  LoginRepository(this.client);

  Future<TokenModel> login(LoginModel login) async {
    try {
      final result = await client.request(
        path: "login",
        method: MethodHttp.post,
        body: login.toJson(),
      );
      return TokenModel.fromJson(jsonDecode(result.body));
    } on Exception {
      throw Exception("Erro ao efetuar login, verifique suas credenciais");
    }
  }
}
