import 'package:seventh_prova_flutter/app/models/video_model.dart';

abstract class HomeRepositoryInterface {
  Future<VideoModel> getVideo(String fileName);
}
