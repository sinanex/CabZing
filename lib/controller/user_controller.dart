import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vikncodes/model/login_model.dart';
import 'package:vikncodes/services/login/logins_services.dart';
import 'package:vikncodes/services/login/profile_services.dart';
import 'package:vikncodes/view/profile/profile_screen.dart';

class UserController extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  ProfileServices _services = ProfileServices();
  Loginservices loginservices = Loginservices();
  String? name;
  String? email;
  String? photo;
  void loginUser(BuildContext context) async {
    try {
      if (usernameController.text.isNotEmpty &&
          passwordController.text.isNotEmpty) {
        final user = LoginModel(
            password: passwordController.text,
            username: usernameController.text);

        String? message = await loginservices.loginUser(user);

        if (message != null) {
          log("log success");
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ProfileScreen()));
        }
      }
    } catch (e) {}
  }

  void getProfileData() async {
    _services.getProfileData();
    name = await _secureStorage.read(key: 'name');
    email = await _secureStorage.read(key: 'email');
    photo = await _secureStorage.read(key: 'photo');

    log("name $name");

    notifyListeners();
  }
}
