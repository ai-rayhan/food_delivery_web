// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/snackbar.dart';
import 'package:food_delivery_web/screens/admin/update_product.dart';

class ManageProduct extends StatefulWidget {
  const ManageProduct({super.key});

  @override
  State<ManageProduct> createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  String docId = 'allproduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Product'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .doc(docId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final prodList =
              snapshot.data!.get('productdetails') as List<dynamic>;

          return ListView.builder(
            itemCount: prodList.length,
            itemBuilder: (context, index) {
              final prod = prodList[index] as Map<String, dynamic>;

              return Dismissible(
                key: Key(prod['id']),
                onDismissed: (_) async {
                  await FirebaseFirestore.instance
                      .collection('products')
                      .doc(docId)
                      .update({
                    'productdetails': FieldValue.arrayRemove([prod]),
                  });
                  showSnackBar(context, "Deleted");
                },
                child: Card(
                  child: ListTile(
                    leading: Image.network(prod['image'], width: 50),
                    subtitle: Text(prod['price'].toString()),
                    title: Text(prod['name']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateProduct(
                                            productId: prod['id'])));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('products')
                                    .doc(docId)
                                    .update({
                                  'productdetails':
                                      FieldValue.arrayRemove([prod]),
                                });
                                showSnackBar(context, "Deleted");
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
