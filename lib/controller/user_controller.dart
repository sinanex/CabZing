import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vikncodes/model/login_model.dart';
import 'package:vikncodes/services/login/logins_services.dart';
import 'package:vikncodes/services/login/profile_services.dart';
import 'package:vikncodes/view/bottom/bottomBar.dart';

class UserController extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  ProfileServices _services = ProfileServices();
  Loginservices loginservices = Loginservices();
  String? name;
  String? email;
  String? photo;
  bool isLoading = false;
  void setLoading(bool value) {
   isLoading  = value;
    notifyListeners(); 
  }

  Future<void> loginUser(BuildContext context) async {
    setLoading(true); 
    try {
      if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
        final user = LoginModel(
          password: passwordController.text,
          username: usernameController.text,
        );

        String? message = await loginservices.loginUserSer(user);

        if (message != null) {
          setLoading(false); 
          log("Login success");
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (_) => Bottombar(index: 0,)),
          );
        }
      } else {
        setLoading(false); 
      }
    } catch (e) {
      setLoading(false);
    }
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
