import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:vikncodes/view/bottom/bottomBar.dart';
import 'package:vikncodes/view/login/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
_splashScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png',
              width: 100,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "CabZing",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _splashScreen(BuildContext context)async{
   FlutterSecureStorage _storeage = FlutterSecureStorage(); 

 final token =  await _storeage.read(key: 'access');

 if(token == null||token.isEmpty){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Loginscreen()));
 }else{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Bottombar(index: 0,)));
 }
 
}
