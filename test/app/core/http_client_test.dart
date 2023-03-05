import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:seventh_prova_flutter/app/core/http/http_client.dart';
import 'package:seventh_prova_flutter/app/models/response_error.dart';
import 'package:seventh_prova_flutter/app/models/token_model.dart';
import 'package:seventh_prova_flutter/app/util/enum/http_error.dart';
import 'package:seventh_prova_flutter/app/util/enum/method_http.dart';

void main() {
  setUp(() {});

  test('Should return sucess', () async {
    final client = MockClient((_) async =>
        Response(jsonEncode(TokenModel(token: "token").toJson()), 200));
    final httpClient = HttpClient(client);

    var result =
        await httpClient.request(path: "login", method: MethodHttp.post);
    final token = TokenModel.fromJson(result);
    expect(token.token, "token");
  });

  test('Should return Unauthorized Error', () async {
    final client = MockClient((_) async =>
        Response(jsonEncode(ResponseError(message: "").toJson()), 401));
    final httpClient = HttpClient(client);

    try {
      await httpClient.request(path: "login", method: MethodHttp.post);
    } on HttpError catch (error) {
      expect(error, HttpError.unauthorized);
    }
  });

  test('Should return Not Found Error', () async {
    final client = MockClient((_) async =>
        Response(jsonEncode(ResponseError(message: "").toJson()), 404));
    final httpClient = HttpClient(client);

    try {
      await httpClient.request(path: "login", method: MethodHttp.post);
    } on HttpError catch (error) {
      expect(error, HttpError.notFound);
    }
  });

  test('Should return Bad Request Error', () async {
    final client = MockClient((_) async =>
        Response(jsonEncode(ResponseError(message: "").toJson()), 400));
    final httpClient = HttpClient(client);

    try {
      await httpClient.request(path: "login", method: MethodHttp.post);
    } on HttpError catch (error) {
      expect(error, HttpError.badRequest);
    }
  });

  test('Should return Server Error', () async {
    final client = MockClient((_) async =>
        Response(jsonEncode(ResponseError(message: "").toJson()), 500));
    final httpClient = HttpClient(client);

    try {
      await httpClient.request(path: "login", method: MethodHttp.post);
    } on HttpError catch (error) {
      expect(error, HttpError.serverError);
    }
  });
}
