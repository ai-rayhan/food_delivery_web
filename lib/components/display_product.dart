import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String name;
  final String image;
  final double price;

  Product({required this.name, required this.image, required this.price});
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

               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
      
                return Container(
                  decoration: BoxDecoration(color: Colors.white,),
                  
                  child: Column(
                  mainAxisSize: MainAxisSize.min,
children: [
  Image.network(product.image),
  Text(product.name),
  Text('\$${product.price.toStringAsFixed(2)}')
],
                ),);
              },
            );
          }),
    );
      
  }
}
