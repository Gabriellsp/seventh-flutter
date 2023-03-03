import 'package:http/http.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage.dart';
import 'package:seventh_prova_flutter/app/core/http/http_client.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';
import 'package:seventh_prova_flutter/app/models/token_model.dart';
import 'package:seventh_prova_flutter/app/util/enum/method_http.dart';

class AuthClient {
  final HttpClient _httpClient;
  final AuthStorage _storage;
  AuthClient()
      : _httpClient = HttpClient(Client()),
        _storage = AuthStorage.instance;

  Future<void> login(LoginModel login) async {
    final result = await _httpClient.request(
      path: "login",
      method: MethodHttp.post,
      body: login.toJson(),
    );
    var token = TokenModel.fromJson(result);
    _storage.saveTokenToStorage(token);
  }

  Future<TokenModel> loadTokenFromCache() async {
    return await _storage.getTokenFromStorage();
  }
}
