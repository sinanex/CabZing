import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Bottombar extends StatelessWidget {
  const Bottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Iconsax.home),label: 'home'),
        BottomNavigationBarItem(icon: Icon(Iconsax.profile),label: 'home')
      ]),
    );
  }
}