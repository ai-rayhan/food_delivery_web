import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/firebase_options.dart';
import 'package:food_delivery_web/screens/CRUD.dart';
import 'package:food_delivery_web/screens/about_us.dart';
import 'package:food_delivery_web/screens/auth_screen.dart';
import 'package:food_delivery_web/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //removing debugbanner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: const AuthWrapper(),
      routes: {
          HomeScreen.routename: (ctx) => HomeScreen(),
        },
    );
  }


  
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    if (firebaseUser != null && firebaseUser.emailVerified) {
      return const HomeScreen();
    } else {
      return const AuthScreen();
    }
  }}
