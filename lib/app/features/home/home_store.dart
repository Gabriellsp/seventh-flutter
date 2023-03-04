import 'package:mobx/mobx.dart';
import 'package:seventh_prova_flutter/app/features/home/home_repository.dart';
import 'package:seventh_prova_flutter/app/models/video_model.dart';
import 'package:seventh_prova_flutter/app/util/enum/http_error.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepository repository;
  HomeStoreBase(this.repository);

  final String _videoName = "bunny.mp4";

  @readonly
  VideoModel _video = VideoModel(url: "");

  @observable
  bool _isLoading = true;

  @observable
  String _messageError = "";

  @observable
  bool _showMessageError = false;

  bool get isLoading => _isLoading;

  String get messageError => _messageError;

  bool get showMessageError => _showMessageError;

  @action
  void setIsLoading(bool value) {
    _isLoading = value;
  }

  @action
  void setShowMessage(bool value) {
    _showMessageError = value;
  }

  @action
  void setMessageError(String value) {
    _showMessageError = true;
    _messageError = value;
  }

  @action
  Future<void> initialize() async {
    try {
      _video = await repository.getVideo(_videoName);
    } on HttpError catch (error) {
      switch (error) {
        case HttpError.unauthorized:
          setMessageError("Sessão expirada! Faça o login novamente...");
          break;
        default:
          setMessageError("Error ao buscar url do vídeo!");
          break;
      }
    }
    setIsLoading(false);
  }
}
