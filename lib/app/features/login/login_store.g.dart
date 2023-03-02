// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreBase, Store {
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

  late final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase', context: context);

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
