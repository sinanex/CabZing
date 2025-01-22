class LoginModel {
  String? username;
  String? password;

  LoginModel({required this.password, required this.username});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
