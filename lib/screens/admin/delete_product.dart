import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_web/components/snackbar.dart';

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({super.key});

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  String docId = 'allproduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Product'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('products')
            .doc(docId)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
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
                    title: Text(prod['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(prod['link']),
                      ],
                    ),
                    trailing: IconButton(
                        onPressed: () async {
                          await FirebaseFirestore.instance
                              .collection('products')
                              .doc(docId)
                              .update({
                            'productdetails': FieldValue.arrayRemove([prod]),
                          });
                          showSnackBar(context, "Deleted");
                        },
                        icon: Icon(Icons.delete)),
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
