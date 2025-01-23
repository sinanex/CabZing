import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/user_controller.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Spacer(),
                  Icon(Iconsax.language_circle),
                  Text(
                    " English",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Login to your vikn account',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(8, 19, 30, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      editedTextField(
                        controller: value.usernameController,
                        imagePath: 'assets/user-2.png',
                        hintText: 'Username',
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Username empty';
                          }
                          return null;
                        },
                      ),
                      const Divider(color: Colors.grey),
                      editedTextField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Enter Password';
                          }
                          return null;
                        },
                        controller: value.passwordController,
                        imagePath: 'assets/key-round.png',
                        hintText: 'Password',
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgotten Password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 48,
                width: 128,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromRGBO(14, 117, 244, 1),
                  ),
                  onPressed: value.isLoading
                      ? null // Disable button while loading
                      : ()  {
                          if (_formKey.currentState!.validate()) {
                             value.loginUser(context);
                          }
                        },
                  child: value.isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        )
                      : const Text("Login"),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Don’t have an Account?',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Sign up now!',
                        style: TextStyle(
                          color: Color.fromRGBO(14, 117, 244, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget editedTextField({
    required TextEditingController controller,
    required String imagePath,
    required String hintText,
    String? Function(String?)? validator,
    bool isPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
        hintText: hintText,
        prefixIcon: Image.asset(imagePath),
      ),
      validator: validator,
    );
  }
}
