import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/appbar.dart';
import 'package:food_delivery_web/components/footer.dart';
import 'package:food_delivery_web/components/services_card.dart';
import 'package:food_delivery_web/constants/constants.dart';
import 'package:food_delivery_web/models/responsive.dart';

import '../constants/constant.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyAppBar(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    height: devicesize(context).height / 1.5,
                    width: devicesize(context).width / 1.1,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/banner.png'),
                            alignment: Alignment.bottomRight)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100, left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: const [
                                Text(
                                  "About Us",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Welcome to our company! We are a team of passionate professionals dedicated to providing high-quality services to our clients.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(flex: 2, child: SizedBox())
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const ServicesCard(),
            Column(
              children: [
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
                const Divider(),
                // Team Members
                Responsive(
                  mobile: Column(
                    children: const [
                      MemberCard(
                        image: 'assets/images/member3.png',
                        title: 'Jone Deo',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      MemberCard(
                        image: 'assets/images/member2.png',
                        title: 'Jone Deo',
                      ),
                    ],
                  ),
                  tablet: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      MemberCard(
                        image: 'assets/images/member3.png',
                        title: 'Jone Deo',
                      ),
                      MemberCard(
                        image: 'assets/images/member2.png',
                        title: 'Jone Deo',
                      ),
                    ],
                  ),
                  desktop: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      MemberCard(
                        image: 'assets/images/member3.png',
                        title: 'Jone Deo',
                      ),
                      SizedBox(
                        width: 175,
                      ),
                      MemberCard(
                        image: 'assets/images/member2.png',
                        title: 'Jone Deo',
                      ),
                    ],
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
                const Divider(),
                // Contact Information
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.email),
                    title: Text('info@mycompany.com'),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('(123) 456-7890'),
                  ),
                ),
                Footer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  const MemberCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);
  final String image, title;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        padding: const EdgeInsets.all(kPadding / 2),
        width: 300,
        height: 400,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                image,
                height: 250,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
