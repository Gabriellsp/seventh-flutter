import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:seventh_prova_flutter/app/models/response_error.dart';
import 'package:seventh_prova_flutter/app/shared/global_store/global_store.dart';

class ErrorInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async =>
      data;

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    final globalStore = Modular.get<GlobalStore>();

    switch (data.statusCode) {
      case 200:
        break;
      case 400:
      case 401:
      case 404:
        final response = ResponseError.fromJson(jsonDecode(data.body!));
        globalStore.setMessageError(response.message!);
        break;
      default:
        globalStore.setMessageError("Unexpected error! Try again later ...");
        break;
    }
    return data;
  }
}
