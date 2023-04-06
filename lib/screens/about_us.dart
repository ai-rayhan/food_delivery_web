import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Welcome to our company! We are a team of passionate professionals dedicated to providing high-quality services to our clients.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Our Team',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Team Members
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar1.png'),
              ),
              title: Text('John Doe'),
              subtitle: Text('CEO'),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar2.png'),
              ),
              title: Text('Jane Smith'),
              subtitle: Text('CTO'),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Our Mission',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Mission Statement
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Our mission is to help our clients achieve their goals by providing top-quality services that exceed their expectations.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Awards and Recognition',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Awards and Achievements
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'We are proud to have received the "Best Service Provider" award from XYZ Magazine for three consecutive years.',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // Contact Information
            ListTile(
              leading: Icon(Icons.email),
              title: Text('info@mycompany.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('(123) 456-7890'),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Social Media Links
                  Icon(Icons.facebook),
                  SizedBox(width: 10),
                  Icon(Icons.twitter),
                  SizedBox(width: 10),
                  Icon(Icons.instagram),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
