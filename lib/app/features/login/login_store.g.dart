// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: 'LoginStoreBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_userNameAtom =
      Atom(name: 'LoginStoreBase._userName', context: context);

  @override
  String get _userName {
    _$_userNameAtom.reportRead();
    return super._userName;
  }

  @override
  set _userName(String value) {
    _$_userNameAtom.reportWrite(value, super._userName, () {
      super._userName = value;
    });
  }

  late final _$_passwordAtom =
      Atom(name: 'LoginStoreBase._password', context: context);

  @override
  String get _password {
    _$_passwordAtom.reportRead();
    return super._password;
  }

  @override
  set _password(String value) {
    _$_passwordAtom.reportWrite(value, super._password, () {
      super._password = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginStoreBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$verifyUserHasTokenAsyncAction =
      AsyncAction('LoginStoreBase.verifyUserHasToken', context: context);

  @override
  Future<void> verifyUserHasToken() {
    return _$verifyUserHasTokenAsyncAction
        .run(() => super.verifyUserHasToken());
  }

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserName(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
