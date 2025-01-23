import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:vikncodes/controller/bottomBar_controller.dart';
import 'package:vikncodes/controller/sale_controller.dart';
import 'package:vikncodes/controller/user_controller.dart';
import 'package:vikncodes/view/bottom/bottomBar.dart';
import 'package:vikncodes/view/home/homeScreen.dart';
import 'package:vikncodes/view/login/loginScreen.dart';
import 'package:vikncodes/view/splash/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserController()),
        ChangeNotifierProvider(create: (context) => SaleController()),
        ChangeNotifierProvider(create: (context) => BottombarController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, 

        darkTheme: ThemeData.dark().copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        themeMode: ThemeMode.dark,
        home:SplashScreen()
      ),
    );
  }
}
