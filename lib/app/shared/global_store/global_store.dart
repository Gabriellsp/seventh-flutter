import 'package:mobx/mobx.dart';
part 'global_store.g.dart';

class GlobalStore = GlobalStoreBase with _$GlobalStore;

abstract class GlobalStoreBase with Store {
  @observable
  String _messageError = "";

  @observable
  bool _showMessageError = false;

  String get messageError => _messageError;

  bool get showMessageError => _showMessageError;

  @action
  void setShowMessage(bool value) {
    _showMessageError = value;
  }

  @action
  void setMessageError(String value) {
    _showMessageError = true;
    _messageError = value;
  }
}
