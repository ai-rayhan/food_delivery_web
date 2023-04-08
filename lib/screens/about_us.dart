import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/header.dart';
import 'package:food_delivery_web/constants/constants.dart';

import '../constants/constant.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Header(),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal:devicesize(context).width/6, vertical: devicesize(context).height/6),
              color: kSecondaryColor,
              child: Column(
                children: [
                  const Text("About Us",style: TextStyle(fontSize: 30),),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Welcome to our company! We are a team of passionate professionals dedicated to providing high-quality services to our clients.',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Our Team',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Team Members
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/member2.png'),
                    ),
                    title: Text('John Doe'),
                    subtitle: Text('CEO'),
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/member3.png'),
                    ),
                    title: Text('Jane Smith'),
                    subtitle: Text('CTO'),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Our Mission',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Mission Statement
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Our mission is to help our clients achieve their goals by providing top-quality services that exceed their expectations.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Awards and Recognition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Awards and Achievements
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'We are proud to have received the "Best Service Provider" award from XYZ Magazine for three consecutive years.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: const Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Contact Information
                  const ListTile(
                    leading: Icon(Icons.email),
                    title: Text('info@mycompany.com'),
                  ),
                  const ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('(123) 456-7890'),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Social Media Links
                        const Icon(Icons.facebook),
                        const SizedBox(width: 10),
                        const Icon(Icons.brightness_medium),
                        const SizedBox(width: 10),
                        const Icon(Icons.insert_page_break_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
