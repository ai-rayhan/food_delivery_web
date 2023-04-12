import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../models/product_model.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final  product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: InkWell(
        onTap: press,
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(20),
          child: GridTile(
            footer: SizedBox(
              child: Column(
                children: [
                  //  TextButton(
                  //   onPressed: () {},
                  //   style: const ButtonStyle(
                  //       backgroundColor:
                  //           MaterialStatePropertyAll(Colors.deepOrange)),
                  //   child: const Text(
                  //     "Add to Cart",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  // ),
                  GridTileBar(
                    title: Column(
                      children: [
                        Text(
                          product.name,
                          style:
                              const TextStyle(fontSize: 20, color: Colors.deepOrange),
                        ),
                      ],
                    ),
                    leading:  Text("\$${product.price.toString()}"),
                    trailing:  IconButton(icon: Icon(Icons.shopping_cart,color:Colors.deepOrange,),onPressed: (){},),
                    backgroundColor: Colors.white,
                  ),
                 
                  
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
               product.image,
               fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
