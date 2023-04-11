import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_web/screens/product_details_screen.dart';

class Product {
  final String name;
  final String image;
  final double price;
  final String id;
  final String description;
  final String category;

  Product(
      {required this.name,
      required this.image,
      required this.price,
      required this.category,
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
        category: details['category'],
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

            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                // mainAxisSpacing: 8.0,
                // crossAxisSpacing: 8.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailsScreen(
                                    category: product.category,
                                    description: product.description,
                                    id: product.id,
                                    image: product.image,
                                    name: product.name,
                                    price: product.price,
                                  )));
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(product.image),
                          Text(product.name),
                          Text('\$${product.price.toStringAsFixed(2)}')
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
