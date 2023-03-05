import 'package:http/http.dart';
import 'package:seventh_prova_flutter/app/core/auth/auth_client.dart/auth_client_interface.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage_interface.dart';
import 'package:seventh_prova_flutter/app/core/http/http_client.dart';
import 'package:seventh_prova_flutter/app/core/http/http_client_interface.dart';
import 'package:seventh_prova_flutter/app/models/login_model.dart';
import 'package:seventh_prova_flutter/app/models/token_model.dart';
import 'package:seventh_prova_flutter/app/util/enum/method_http.dart';

class AuthClient implements AuthClientInterface {
  final HttpClientInterface _httpClient;
  final AuthStorageInterface _storage;
  AuthClient(Client client)
      : _httpClient = HttpClient(client),
        _storage = AuthStorage.instance;

  @override
  Future<void> login(LoginModel login) async {
    final result = await _httpClient.request(
      path: "login",
      method: MethodHttp.post,
      body: login.toJson(),
    );
    var token = TokenModel.fromJson(result);
    _storage.saveTokenToStorage(token);
  }

  @override
  Future<TokenModel> loadTokenFromCache() async {
    return await _storage.getTokenFromStorage();
  }
}
