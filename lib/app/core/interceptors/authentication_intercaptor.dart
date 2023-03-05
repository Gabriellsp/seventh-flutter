import 'package:http_interceptor/http_interceptor.dart';
import 'package:seventh_prova_flutter/app/core/auth/storage/auth_storage_interface.dart';

class AutheticationInterceptor implements InterceptorContract {
  final AuthStorageInterface _authStorage;
  AutheticationInterceptor(this._authStorage);
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    final tokenStorage = await _authStorage.getTokenFromStorage();
    data.headers["x-access-token"] = tokenStorage.token!;

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
