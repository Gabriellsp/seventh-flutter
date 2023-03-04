import 'dart:async';
import 'dart:convert' show jsonEncode, jsonDecode;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage_interface.dart';
import 'package:seventh_prova_flutter/app/models/token_model.dart';

class AuthStorage implements AuthStorageInterface {
  static AuthStorage? _instance;
  final FlutterSecureStorage _secureStorage;
  final String _tokenId = "token";

  AuthStorage._() : _secureStorage = const FlutterSecureStorage();

  static AuthStorage get instance {
    _instance ??= AuthStorage._();
    return _instance!;
  }

  @override
  Future<void> saveTokenToStorage(TokenModel token) async {
    var data = token.toJson();
    var json = jsonEncode(data);
    await _secureStorage.write(key: _tokenId, value: json);
  }

  @override
  Future<TokenModel> getTokenFromStorage() async {
    var json = await _secureStorage.read(key: _tokenId);
    if (json == null) return TokenModel(token: "");
    try {
      var data = jsonDecode(json);
      return TokenModel.fromJson(data);
    } catch (exception) {
      throw Exception("Falha ao recarregar o token!"); // criar erro para isso
    }
  }

  @override
  Future clearToken() async {
    await _secureStorage.delete(key: _tokenId);
  }
}
