import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/user_controller.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Consumer<UserController>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
              Text('Login to your vikn account'),
              Container(
                color: Color.fromRGBO(8, 19, 30, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    editedTextfeild(
                        controller: value.usernameController,
                        imagePath: 'assets/user-2.png',
                        hintText: 'Username'),
                    Divider(),
                    editedTextfeild(
                        controller: value.passwordController,
                        imagePath: 'assets/key-round.png',
                        hintText: 'Password'),
                  ],
                ),
              ),
              Text('Forgotten Password?'),
              SizedBox(
                height: 48,
                width: 128,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color.fromRGBO(14, 117, 244, 1)),
                    onPressed: () {
                      value.loginUser();
                    },
                    child: Text("login")),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text('Don’t have an Account?'),
                    Text(
                      'Sign up now!',
                      style: TextStyle(color: Color.fromRGBO(14, 117, 244, 1)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextField editedTextfeild(
      {TextEditingController? controller,
      String? imagePath,
      String? hintText}) {
    return TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 12),
          hintText: hintText,
          prefixIcon: Image.asset(imagePath!)),
      controller: controller,
    );
  }
}
