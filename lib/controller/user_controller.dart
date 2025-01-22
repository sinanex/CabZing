import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vikncodes/model/usermodel.dart';
import 'package:vikncodes/services/login/logins_services.dart';
import 'package:vikncodes/view/profile/profile_screen.dart';

class UserController extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Loginservices loginservices = Loginservices();

  void loginUser(BuildContext context)async {
    try {
      if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      final user = Usermodel(
          password: passwordController.text, username: usernameController.text);

     String? message = await loginservices.loginUser(user);

     if(message !=null){
      log("log success");
      Navigator.push(context, MaterialPageRoute(builder: (_)=>ProfileScreen()));
     }

    }

    } catch (e) {
      
    }
  }
}
