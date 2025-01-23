import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/bottomBar_controller.dart';
import 'package:vikncodes/view/home/homeScreen.dart';
import 'package:vikncodes/view/profile/profile_screen.dart';

// ignore: must_be_immutable
class Bottombar extends StatefulWidget {
  int index = 0;
  Bottombar({super.key,required this.index});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  void initState() {
    super.initState();
       widget.index =  Provider.of<BottombarController>(context,listen: false).currentIndex;
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [Homescreen(), ProfileScreen()];
    return Consumer<BottombarController>(
      builder:(context, value, child) =>  Scaffold(
        body: screens[value.currentIndex],
        bottomNavigationBar: 
              BottomNavigationBar(
                backgroundColor: Colors.black,
                selectedItemColor: Colors.white,
                onTap: (index) {
           value.changeIndex(index);
                },
                currentIndex: value.currentIndex, items: [
            BottomNavigationBarItem(icon: Icon(Iconsax.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'profile')
          ]),
        ),
      );
  }
}
