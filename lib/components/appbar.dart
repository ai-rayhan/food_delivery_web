import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/snackbar.dart';
import 'package:food_delivery_web/provider/auth_provider.dart';
import 'package:food_delivery_web/screens/admin/main_screen.dart';
import 'package:food_delivery_web/screens/auth_screen.dart';
import 'package:food_delivery_web/screens/faq_screen.dart';
import 'package:food_delivery_web/screens/home_screen.dart';
import 'package:food_delivery_web/screens/reviews_screen.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  //////////////////get data from firebase firestore//////////////
  bool isLoading = false;
  final String uid = FirebaseAuth.instance.currentUser!.uid;

  var userData = {};

  getData() async {
    try {
      setState(() {
        isLoading = true;
      });
      var snapData = await FirebaseFirestore.instance
          .collection('currentloggedinuser')
          .doc(uid)
          .get();

      setState(() {
        isLoading = true;
      });

      userData = snapData.data()!;

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

/////////////////get data from firestore/////////////
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return isLoading
        ? AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.1,
            backgroundColor: Colors.deepOrange,
            title: const Text(
              "Foodie",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewScreen()));
                },
                child: const Text(
                  "Review",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FAQPage()));
                },
                child: const Text(
                  "FAQ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await authProvider.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          )
        : AppBar(
            automaticallyImplyLeading: false,
            elevation: 0.1,
            backgroundColor: Colors.deepOrange,
            title: const Text(
              "Foodie",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReviewScreen()));
                },
                child: const Text(
                  "Review",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FAQPage()));
                },
                child: const Text(
                  "FAQ",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              if (userData['admin'] == true)
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminScreen()));
                  },
                  child: const Text(
                    "Admin panel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              TextButton(
                onPressed: () async {
                  await authProvider.signOut();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => AuthScreen()));
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart),
              ),
            ],
          );
  }
}
