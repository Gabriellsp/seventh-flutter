class VideoModel {
  String? url;

  VideoModel({this.url});

  VideoModel.fromJson(Map<String, dynamic> json) {
    url = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = url;
    return data;
  }
}
