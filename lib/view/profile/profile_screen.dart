import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/user_controller.dart';
import 'package:vikncodes/view/profile/profile_widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserController>(context, listen: false).getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 100,
              child: Consumer<UserController>(
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
  
                      child: Image.network(
                        width: 100,
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
                    Column(
                      children: [
                        Text(value.name ?? 'name'),
                        Text(value.email ?? 'email'),
                      ],
                    ),
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
            child: Container(
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
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
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
          profilePagetile(icon: Iconsax.security_safe, text: 'Praivacy Policy'),
        ],
      ),
    );
  }
}
