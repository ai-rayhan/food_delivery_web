import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/snackbar.dart';
import 'package:food_delivery_web/screens/admin/main_screen.dart';
import 'package:food_delivery_web/screens/faq_screen.dart';
import 'package:food_delivery_web/screens/home_screen.dart';
import 'package:food_delivery_web/screens/reviews_screen.dart';

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
    getData();
  }



/////////////////get data from firestore/////////////
  @override
  Widget build(BuildContext context) {
    return isLoading?AppBar(
      elevation: 0.1,
      backgroundColor: Colors.deepOrange,
      title: Text(
        "Foodie",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, HomeScreen.routename);
          },
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen()));
          },
          child: Text(
            "Review",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));

          },
          child: Text(
            "FAQ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    ): AppBar(
      elevation: 0.1,
      backgroundColor: Colors.deepOrange,
      title: Text(
        "Foodie",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen()));

          },
          child: Text(
            "Review",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FAQPage()));

          },
          child: Text(
            "FAQ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        if(userData['admin']==true)
         TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminScreen()));
          },
          child: Text(
            "Admin panel",
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
