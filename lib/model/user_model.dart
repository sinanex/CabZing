class UserModel {
  String? profile_img;
  String? first_name;
  String? email;

  UserModel(
      {required this.email,
      required this.first_name,
      required this.profile_img});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        email: json['data']['email'],
        first_name: json['data']['first_name'],
        profile_img: json['customer_data']['photo']);
  }
}
