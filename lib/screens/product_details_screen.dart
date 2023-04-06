import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({this.id, this.image, this.title});
  final image;
  final title;
  final id;
  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset(image),);
  }
}
