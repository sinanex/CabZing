import 'package:flutter/material.dart';
import 'package:vikncodes/model/usermodel.dart';
import 'package:vikncodes/services/login/logins_services.dart';

class UserController  extends ChangeNotifier {

  TextEditingController usernameController = TextEditingController();    
  TextEditingController passwordController = TextEditingController();    

  Loginservices loginservices = Loginservices();

  void loginUser(){
    if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
      final user = Usermodel(password: passwordController.text, username: usernameController.text);

loginservices.loginUser(user);
    }
  }
}