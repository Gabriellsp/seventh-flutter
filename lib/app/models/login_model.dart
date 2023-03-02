class LoginModel {
  String? username;
  String? password;

  LoginModel({this.username, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, String>? toJson() {
    final Map<String, String> data = <String, String>{};
    data['username'] = username ?? "";
    data['password'] = password ?? "";
    return data;
  }
}
