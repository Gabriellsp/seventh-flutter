import 'dart:io';

import 'package:http_interceptor/http_interceptor.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage.dart';

class WeatherApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      final storage = AuthStorage.instance;
      final tokenStorage = await storage.getTokenFromStorage();
      data.headers["x-access-token"] = tokenStorage.token!;
    } catch (e) {
      print(e);
    }
    print(data.params);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
