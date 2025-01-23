import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/user_controller.dart';
import 'package:vikncodes/view/login/loginScreen.dart';
import 'package:vikncodes/view/profile/profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(15, 15, 15, 1),
      body: SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 100,
                  child: Consumer<UserController>(
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              fit: BoxFit.cover,
                              width:70,
                              height: 70,
                              '${value.photo}',
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.error, size: 40),
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ),
               SizedBox(width: 29,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value.name ?? 'name',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),),
                            Text(value.email ?? 'email',style: TextStyle(
                              fontWeight: FontWeight.bold,

                            ),),
                          ],
                        ),
                                 Spacer(),
                        Icon(Iconsax.edit)
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  profileContainer(
                      color: Color.fromRGBO(181, 205, 254, 1),
                      imagePAth: 'assets/stars.png',
                      mainTitle: '4.3 ',
                      sub: '2233',
                      text: "Rides"),
                  profileContainer(
                      color: Color.fromRGBO(169, 201, 197, 1),
                      imagePAth: 'assets/shield-tick.png',
                      mainTitle: 'KYC',
                      text: 'Verifeid'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    logoutBtn(context);
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        Spacer(),
                        Text(
                          "Logout",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Icon(
                          Iconsax.logout,
                          color: Colors.red,
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              profilePagetile(icon: Icons.settings, text: 'Help'),
              profilePagetile(
                icon: Iconsax.search_normal,
                text: 'FAQ',
              ),
              profilePagetile(icon: Iconsax.user_add, text: 'Invite Friends'),
              profilePagetile(
                  icon: Iconsax.shield_search, text: 'Terms of Services'),
              profilePagetile(
                  icon: Iconsax.security_safe, text: 'Praivacy Policy'),
            ],
          ),
        ),
      ),
    );
  }

  void logoutBtn(BuildContext context) async {
    FlutterSecureStorage _storeage = FlutterSecureStorage();
    await _storeage.delete(key: 'access');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => Loginscreen()),
      (route) => false,
    );
  }
}
