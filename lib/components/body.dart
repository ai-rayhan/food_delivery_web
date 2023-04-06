import 'package:flutter/material.dart';
import 'package:food_delivery_web/screens/product_details_screen.dart';

import '../constants/constants.dart';
import '../models/product_model.dart';
import '../models/responsive.dart';
import 'email_banner.dart';
import 'product.dart';
import 'services_card.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(kPadding),
      constraints: BoxConstraints(maxWidth: kMaxWidth),
      child: Column(
        children: [
          ServicesCard(),
          //now we create model of our product images
          // we are using gridview inside column and scrollview widget thats why we are facing error
          // use shrinkwrap and ScrollPhysics widget
          Responsive(
            desktop: ProductCard(
              crossAxiscount: _size.width < 650 ? 2 : 3,
              aspectRatio: _size.width < 650 ? 0.85 : 1.1,
            ),
            tablet: ProductCard(
              crossAxiscount: _size.width < 825 ? 2 : 3,
              aspectRatio: _size.width < 825 ? 0.85 : 1.1,
            ),
            mobile: ProductCard(
              crossAxiscount: _size.width < 690 ? 2 : 3,
              aspectRatio: _size.width < 560 ? 0.85 : 1.1,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          EmailBanner(),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.crossAxiscount = 3,
    this.aspectRatio = 1.1,
  }) : super(key: key);
  final int crossAxiscount;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxiscount,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) => Products(
        press: () {
          Navigator.push<void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => ProductDetailsScreen(product:products[index],onpress:(){} ,),
            ),
          );
        },
        product: products[index],
      ),
      itemCount: products.length,
    );
  }
}
