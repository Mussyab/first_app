import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/screens/forgot_screen.dart';
import 'package:first_app/screens/home_screen.dart';
import 'package:first_app/screens/login_screen.dart';
import 'package:first_app/screens/navigation_screen.dart';
import 'package:first_app/screens/onboarding_screen.dart';
import 'package:first_app/screens/order_confirm_screen.dart';
import 'package:first_app/screens/payment_method_screen.dart';
import 'package:first_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
  await Firebase.initializeApp();
  runApp(MyApp(
    isFirstTime: isFirstTime,
    user: user,
  ));
}

FirebaseAuth auth = FirebaseAuth.instance;
User? user = auth.currentUser;

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final User? user;

  const MyApp({
    super.key,
    required this.isFirstTime,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    Widget home;

    if (isFirstTime) {
      home = const SplashScreen();
    } else if (user == null) {
      home = LoginScreen();
    } else {
      home = NavigationScreen();
    }

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: home,
      theme: ThemeData(
        primaryColor: Color(0xFFEF6969),
      ),
    );

  
  }
}
