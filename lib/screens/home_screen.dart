// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/appbar.dart';
import 'package:food_delivery_web/components/display_product.dart';
import 'package:food_delivery_web/components/slider.dart';
import '../models/responsive.dart';
import '../constants/constants.dart';

import '../components/footer.dart';

import '../components/menu.dart';
import '../components/services_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routename = 'home';

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context)
        ? Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0.1,
              backgroundColor: Colors.deepOrange,
              title: const Text(
                "Foodie",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
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
                    if (MediaQuery.of(context).size.width > 500) ServicesCard(),
                    //body
                    SizedBox(
                      height: 30,
                    ),
                    ProductListScreen(),

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
          )
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: MyAppBar(),
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    //header
                    SliderWidget(),
                    if (MediaQuery.of(context).size.width > 500) ServicesCard(),
                    //body
                    SizedBox(
                      height: 30,
                    ),
                    ProductListScreen(),

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
