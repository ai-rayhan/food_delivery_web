import 'package:flutter/material.dart';
import 'package:food_delivery_web/constants/constant.dart';


import '../constants/constants.dart';
import '../models/product_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  Widget build(BuildContext context) {
    var devicesize=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Shopping Cart",
            style: TextStyle(
              color: kSecondaryColor,
            )),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      
      body: SafeArea(
          child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: devicesize.width/7, vertical: 10),
        child: ListView(
          children: [
            ListView.builder(
                //use shrink wrap true and scrollphysics to avoid error because we are using listview in side listview or column
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => FavouriteCard(
                      product: products[index],
                      press: () {},
                    ))
          ],
        ),
      )),
    );
  }
}

class FavouriteCard extends StatelessWidget {
  const FavouriteCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
          decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15.0)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    product.image,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor,
                      ),
                    ),
                    Text(
                      'Lorem ipsum salt as seer amer bty ruy erw as dosl poue oiu oi',
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$20",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: const Icon(
                                  Icons.remove,
                                  color: kSecondaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            const Text(
                              "1",
                              style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: const Icon(
                                  Icons.add,
                                  color: kSecondaryColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
