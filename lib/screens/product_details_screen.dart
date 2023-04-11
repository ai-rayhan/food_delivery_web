import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/appbar.dart';
import 'package:food_delivery_web/models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen(
      {super.key,
      required this.name,
      required this.description,
      required this.id,
      required this.image,
      required this.price});
  final String name;
  final String image;
  final double price;
  final String id;
  final String description;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: MyAppBar(),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: Container(
                      height: 550,
                      width: 370,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18, top: 25),
                    child: Container(
                      width: 450,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "\$${widget.price.toString()}",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            widget.description,
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange,
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity -= 1;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      )),
                                  InkWell(
                                    onTap: () {
                                      print("send data to server");
                                    },
                                    child: Text(
                                      "ADD ${quantity.toString()} ITEM TO CART",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity += 1;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                ]),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Total Cost: ${widget.price * quantity}',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]),
          )),
    );
  }
}
