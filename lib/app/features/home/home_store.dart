import 'package:mobx/mobx.dart';
import 'package:seventh_prova_flutter/app/features/home/repository/home_repository_interface.dart';
import 'package:seventh_prova_flutter/app/models/video_model.dart';
import 'package:seventh_prova_flutter/app/util/enum/http_error.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final HomeRepositoryInterface repository;
  HomeStoreBase(this.repository);

  final String _videoName = "bunny.mp4";

  @readonly
  VideoModel _video = VideoModel(url: "");

  @observable
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  @action
  void setIsLoading(bool value) {
    _isLoading = value;
  }

  @action
  Future<void> initialize() async {
    try {
      _video = await repository.getVideo(_videoName);
    } on HttpError catch (_) {}
    setIsLoading(false);
  }
}
