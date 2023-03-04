// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$_videoAtom =
      Atom(name: 'HomeStoreBase._video', context: context);

  VideoModel get video {
    _$_videoAtom.reportRead();
    return super._video;
  }

  @override
  VideoModel get _video => video;

  @override
  set _video(VideoModel value) {
    _$_videoAtom.reportWrite(value, super._video, () {
      super._video = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: 'HomeStoreBase._isLoading', context: context);

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

  late final _$_messageErrorAtom =
      Atom(name: 'HomeStoreBase._messageError', context: context);

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
      Atom(name: 'HomeStoreBase._showMessageError', context: context);

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

  late final _$initializeAsyncAction =
      AsyncAction('HomeStoreBase.initialize', context: context);

  @override
  Future<void> initialize() {
    return _$initializeAsyncAction.run(() => super.initialize());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowMessage(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setShowMessage');
    try {
      return super.setShowMessage(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMessageError(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setMessageError');
    try {
      return super.setMessageError(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
