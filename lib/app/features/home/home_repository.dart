import 'dart:convert';

import 'package:seventh_prova_flutter/app/core/http/http_client.dart';
import 'package:seventh_prova_flutter/app/models/video_model.dart';
import 'package:seventh_prova_flutter/app/util/enum/method_http.dart';

class HomeRepository {
  final HttpClient client;
  HomeRepository(this.client);

  Future<VideoModel> getVideo(String fileName) async {
    try {
      final path = "video/$fileName";
      final result = await client.request(
        path: path,
        method: MethodHttp.get,
      );
      return VideoModel.fromJson(result);
    } on Exception {
      throw Exception("Erro ao buscar o vídeo, tente novamente mais tarde!");
    }
  }
}
