// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_web/components/appbar.dart';
import 'package:food_delivery_web/components/slider.dart';


import '../constants/constants.dart';
import '../components/banner_section.dart';
import '../components/body.dart';
import '../components/email_banner.dart';
import '../components/footer.dart';
import '../components/header.dart';
import '../components/header_container.dart';
import '../components/menu.dart';
import '../components/product.dart';
import '../components/services_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routename='home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      
      
      
      
      AppBar(
        elevation: 0.1,
        backgroundColor: Colors.deepOrange, 
        
            title: Text(
              "Foodie",
              style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
            ),
            actions: [
        
            TextButton(onPressed: (){}, child: Text("Home",style: TextStyle(color: Colors.white),)),
                          TextButton(onPressed: (){}, child: Text("Review",style: TextStyle(color: Colors.white),)),
              TextButton(onPressed: (){}, child: Text("FAQ",style: TextStyle(color: Colors.white),)),


                 IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.shopping_cart)),
               
            ],
          ),
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Foodie",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                      color: kSecondaryColor),
                ),
              ),
            ),
            MobMenu()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //header
              SliderWidget(),
              //body
              BodyContainer(),
              //footer
              SizedBox(
                height: 30,
              ),
              Footer(),
              //now we make our website responsive
            ],
          ),
        ),
      ),
    );
  }
}
