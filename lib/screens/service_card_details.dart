import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/footer.dart';
import 'package:food_delivery_web/components/product.dart';
import 'package:food_delivery_web/components/services_card.dart';

import '../components/email_banner.dart';
import '../components/header.dart';
import '../components/header_container.dart';
import '../constants/constants.dart';

class ServiceCardDetailScreen extends StatelessWidget {
  ServiceCardDetailScreen({this.service,this.onpress});
  final service;
  final onpress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
           padding: const EdgeInsets.all(kPadding),
          //  constraints: BoxConstraints(maxWidth: kMaxWidth),
          child: Column(
            children: [
              const Header(),
              service,
             
             const SizedBox(
              height: 40,
            ),
            Footer()
            ],
            
          ),
        ),
      ),
    );
  }
}
