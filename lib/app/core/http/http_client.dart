import 'package:http/http.dart';
import 'dart:convert';

import 'package:seventh_prova_flutter/app/core/http/http_client_interface.dart';
import 'package:seventh_prova_flutter/app/util/enum/http_error.dart';
import 'package:seventh_prova_flutter/app/util/enum/method_http.dart';

class HttpClient implements HttpClientInterface {
  final Client _client;
  final String host = "http://mobiletest.seventh.com.br";
  HttpClient(Client client) : _client = client;
  @override
  Future<dynamic> request(
      {required String path,
      required MethodHttp method,
      Map? body,
      Map? headers}) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll(
          {'content-type': 'application/json', 'accept': 'application/json'});
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    final url = '$host/$path';
    Future<Response>? futureResponse;
    try {
      switch (method) {
        case MethodHttp.get:
          futureResponse = _client.get(Uri.parse(url), headers: defaultHeaders);
          break;
        case MethodHttp.post:
          futureResponse = _client.post(Uri.parse(url),
              headers: defaultHeaders, body: jsonBody);
          break;
        case MethodHttp.put:
          futureResponse = _client.put(Uri.parse(url),
              headers: defaultHeaders, body: jsonBody);
          break;
      }
      response = await futureResponse.timeout(const Duration(seconds: 10));
    } catch (error) {
      throw HttpError.serverError;
    }
    return _handleResponse(response);
  }

  Map<String, dynamic> _handleResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      default:
        throw HttpError.serverError;
    }
  }
}
