import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/firebase_options.dart';
import 'package:food_delivery_web/provider/cart.dart';
import 'package:food_delivery_web/provider/auth_provider.dart';
import 'package:food_delivery_web/provider/orders.dart';
import 'package:food_delivery_web/screens/about_us.dart';
import 'package:food_delivery_web/screens/auth_screen.dart';
import 'package:food_delivery_web/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => Cart())),
        ChangeNotifierProvider(create: ((context) => Orders('', []))),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        //removing debugbanner
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Montserrat',
        ),
        home: Consumer<AuthProvider>(builder: (_, authProvider, __) {
          if (authProvider.isLoggedIn) {
            return HomeScreen();
          } else {
            return AuthScreen();
          }
        }),
        routes: {
          HomeScreen.routename: (ctx) => HomeScreen(),
        },
        // primarySwatch: Colors.blue,
        // fontFamily: 'Montserrat',
      ),
      // home: Consumer<AuthProvider>(builder: (_, authProvider, __) {
      //   if (authProvider.isLoggedIn) {
      //     return HomeScreen();
      //   } else {
      //     return AuthScreen();
      //   }
      // }),
      // routes: {
      //   HomeScreen.routename: (ctx) => HomeScreen(),
      // },
    );
  }
}
