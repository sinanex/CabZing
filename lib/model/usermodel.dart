class Usermodel {
  String? username;
  String? password;

  Usermodel({required this.password, required this.username});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
