import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/display_product.dart';
import 'package:food_delivery_web/screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../constants/constants.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
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
                          style: const TextStyle(
                              fontSize: 20, color: Colors.deepOrange),
                        ),
                      ],
                    ),
                    leading: Text("\$${product.price.toString()}"),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                        color: Colors.deepOrange,
                      ),
                      onPressed: () {
                        cart.addItem(product.id, product.name, product.price);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Product Added to cart!'),
                          action: SnackBarAction(
                            label: 'View',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartScreen()));
                            },
                          ),
                        ));
                      },
                    ),
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
