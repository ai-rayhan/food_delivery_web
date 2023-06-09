import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_web/components/product.dart' as ui;
import 'package:food_delivery_web/models/responsive.dart';
import 'package:food_delivery_web/screens/product_details_screen.dart';

import 'offer_card.dart';

class Product {
  final String name;
  final String image;
  final double price;
  final String id;
  final String description;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      required this.description,
      required this.id});
}

class ProductService {
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');

  Future<List<Product>> getAllProducts() async {
    final snapshot = await _productsCollection.doc('allproduct').get();
    final List<Product> products = [];

    final List<dynamic> productDetails = snapshot['productdetails'];
    productDetails.forEach((details) {
      final product = Product(
        description: details['description'],
        id: details['id'],
        name: details['name'],
        image: details['image'],
        price: double.parse(details['price'].toString()),
      );
      products.add(product);
    });

    return products;
  }
}

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductService _productService = ProductService();

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      child: FutureBuilder(
          future: _productService.getAllProducts(),
          builder: (context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final products = snapshot.data ?? [];

            if (products.isEmpty) {
              return Center(child: Text('No products found.'));
            }

            return Padding(
              padding: const EdgeInsets.only(left: 40,right: 40),
              child: Column(
                children: [
                 Text("Popular Now",style: TextStyle(fontSize: 25),),
                 Divider(),
                  Responsive(
                    desktop: ProductCard(
                      products: products,
                      crossAxiscount: _size.width < 650 ? 2 : 3,
                      aspectRatio: _size.width < 650 ? 0.85 : 1.1,
                    ),
                    tablet: ProductCard(
                      products: products,
                      crossAxiscount: _size.width < 825 ? 2 : 3,
                      aspectRatio: _size.width < 825 ? 0.85 : 1.1,
                    ),
                    mobile: ProductCard(
                      products: products,
                      crossAxiscount: _size.width < 690 ? 2 : 3,
                      aspectRatio: _size.width < 560 ? 0.85 : 1.1,
                    ),
                  ),
                    OfferCard(),
                    SizedBox(height: 20,),
                    Text("Browse Top Deals",style: TextStyle(fontSize: 25),),
                  Divider(),
                   Responsive(
                    desktop: ProductCard(
                      products: products,
                      crossAxiscount: _size.width < 650 ? 2 : 3,
                      aspectRatio: _size.width < 650 ? 0.85 : 1.1,
                    ),
                    tablet: ProductCard(
                      products: products,
                      crossAxiscount: _size.width < 825 ? 2 : 3,
                      aspectRatio: _size.width < 825 ? 0.85 : 1.1,
                    ),
                    mobile: ProductCard(
                      products: products,
                      crossAxiscount: _size.width < 690 ? 2 : 3,
                      aspectRatio: _size.width < 560 ? 0.85 : 1.1,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.products,
    required this.aspectRatio,
    required this.crossAxiscount,
  });

  final List<Product> products;
  final aspectRatio;
  final crossAxiscount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxiscount, childAspectRatio: aspectRatio
            // mainAxisSpacing: 8.0,
            // crossAxisSpacing: 8.0,
            ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ui.Products(
            product: product,
            press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailsScreen(
                              description: product.description,
                              id: product.id,
                              image: product.image,
                              name: product.name,
                              price: product.price,
                            )));
            },
          );
          // return Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: InkWell(
              // onTap: () {
              //   Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //           builder: (context) => ProductDetailsScreen(
              //                 description: product.description,
              //                 id: product.id,
              //                 image: product.image,
              //                 name: product.name,
              //                 price: product.price,
              //               )));
          //     },
          //     child: Card(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisSize: MainAxisSize.min,
          //         children: [
          //           Image.network(product.image),
          //           Text(product.name),
          //           Text('\$${product.price.toStringAsFixed(2)}')
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
