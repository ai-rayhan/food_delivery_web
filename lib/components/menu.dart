import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/provider/firebase_auth_methods.dart';

import '../constants/constants.dart';
import '../screens/contact_us.dart';
import '../screens/faq_screen.dart';

class HeaderWebMenu extends StatelessWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderMenu(
          press: () {},
          title: "Menu",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Restrurent",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            // Navigator.push<void>(
            //   context,
            //   MaterialPageRoute<void>(
            //     builder: (BuildContext context) => const AboutUsPage(),
            //   ),
            // );
          },
          title: "About us",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const ContactUsPage(),
              ),
            );
          },
          title: "Contact us",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push<void>(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const FAQPage(),
              ),
            );
          },
          title: "FAQ",
        ),
      ],
    );
  }
}

class MobFooterMenu extends StatelessWidget {
  const MobFooterMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        HeaderMenu(
          press: () {},
          title: "Menu",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "For Riders",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "About",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Reviews",
        ),
        const SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Restaurants",
        ),
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}

class MobMenu extends StatefulWidget {
  const MobMenu({Key? key}) : super(key: key);

  @override
  _MobMenuState createState() => _MobMenuState();
}

class _MobMenuState extends State<MobMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderMenu(
            press: () {
              Navigator.pop(context);
            },
            title: "Home",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "Review",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "Admin Panel",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "Order History",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "FAQ",
          ),
          const SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () async {
              await FirebaseAuthMethods(FirebaseAuth.instance).signOut(context);
            },
            title: "Logout",
          ),
        ],
      ),
    );
  }
}
