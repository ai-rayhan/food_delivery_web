// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/footer.dart';

import '../components/header.dart';
import '../constants/constants.dart';

class ServiceCardDetailScreen extends StatelessWidget {
  const ServiceCardDetailScreen({super.key, this.service, this.onpress});
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
