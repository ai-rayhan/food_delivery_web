import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../screens/about_us.dart';
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
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Restrurent",
        ),
        SizedBox(
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
        SizedBox(
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
        SizedBox(
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
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "For Riders",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "About",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Reviews",
        ),
        SizedBox(
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
      child: Container(
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
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
            press: () {},
            title: "Menu",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "For Riders",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "About",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "Reviews",
          ),
          SizedBox(
            height: kPadding,
          ),
          HeaderMenu(
            press: () {},
            title: "Restaurants",
          ),
        ],
      ),
    );
  }
}
