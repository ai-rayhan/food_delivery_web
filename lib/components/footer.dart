import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/constants.dart';
import '../models/responsive.dart';
import 'menu.dart';

class Footer extends StatelessWidget {
  var kSecondaryColor;

  Footer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: kPrimaryColor,
      child: Container(
        padding: const EdgeInsets.all(kPadding),
        constraints: const BoxConstraints(maxWidth: kMaxWidth),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        "Foodie",
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w900,
                            color: kSecondaryColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const[
                          SocialIcon(
                            icon: "assets/icons/google-icon.svg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SocialIcon(
                            icon: "assets/icons/facebook-2.svg",
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SocialIcon(
                            icon: "assets/icons/twitter.svg",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                if (Responsive.isDesktop(context))
                  const Expanded(flex: 3, child: HeaderWebMenu()),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            if (!Responsive.isDesktop(context)) const MobFooterMenu(),
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
          )),
      child: SvgPicture.asset(icon),
    );
  }
}
