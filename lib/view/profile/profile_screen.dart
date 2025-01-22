import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vikncodes/view/profile/profile_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
    
                  Column(
                    children: [
                      Text("David arnold"),
                      Text("muhammedsinanx4@gmail.com"),
                    ],
                  ),
                  Icon(Iconsax.edit)
                ],
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
                  Text("Logout",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),),
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
          profilePagetile(icon: Icons.settings,text: 'Help'),
          profilePagetile(icon: Iconsax.search_normal,text: 'FAQ',),
          profilePagetile(icon: Iconsax.user_add,text: 'Invite Friends'),
          profilePagetile(icon: Iconsax.shield_search,text: 'Terms of Services'),
          profilePagetile(icon: Iconsax.security_safe,text: 'Praivacy Policy'),
        ],
      ),
    );
  }



 
}
