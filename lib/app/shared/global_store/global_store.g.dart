// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GlobalStore on GlobalStoreBase, Store {
  late final _$_messageErrorAtom =
      Atom(name: 'GlobalStoreBase._messageError', context: context);

  @override
  String get _messageError {
    _$_messageErrorAtom.reportRead();
    return super._messageError;
  }

  @override
  set _messageError(String value) {
    _$_messageErrorAtom.reportWrite(value, super._messageError, () {
      super._messageError = value;
    });
  }

  late final _$_showMessageErrorAtom =
      Atom(name: 'GlobalStoreBase._showMessageError', context: context);

  @override
  bool get _showMessageError {
    _$_showMessageErrorAtom.reportRead();
    return super._showMessageError;
  }

  @override
  set _showMessageError(bool value) {
    _$_showMessageErrorAtom.reportWrite(value, super._showMessageError, () {
      super._showMessageError = value;
    });
  }

  late final _$GlobalStoreBaseActionController =
      ActionController(name: 'GlobalStoreBase', context: context);

  @override
  void setShowMessage(bool value) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setShowMessage');
    try {
      return super.setShowMessage(value);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessageError(String value) {
    final _$actionInfo = _$GlobalStoreBaseActionController.startAction(
        name: 'GlobalStoreBase.setMessageError');
    try {
      return super.setMessageError(value);
    } finally {
      _$GlobalStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
