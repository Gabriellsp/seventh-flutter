import 'package:seventh_prova_flutter/app/util/enum/method_http.dart';

abstract class HttpClientInterface {
  Future<dynamic> request(
      {required String path,
      required MethodHttp method,
      Map? body,
      Map? headers});
}
