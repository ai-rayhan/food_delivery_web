// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateProduct extends StatefulWidget {
  final String productId;

  const UpdateProduct({super.key, required this.productId});

  @override
  UpdateProductState createState() => UpdateProductState();
}

class UpdateProductState extends State<UpdateProduct> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final name = _nameController.text;
    final price = double.parse(_priceController.text);
    final imageUrl = _imageUrlController.text;
    final description = _descriptionController.text;
    try {
      await FirebaseFirestore.instance
          .collection('products')
          .doc('allproduct')
          .get()
          .then((docSnapshot) {
        if (docSnapshot.exists) {
          List<dynamic> prod = docSnapshot.data()!['productdetails'];
          int index = prod.indexWhere((p) => p['id'] == widget.productId);
          prod[index]['name'] = name;
          prod[index]['price'] = price;
          prod[index]['image'] = imageUrl;
          prod[index]['description'] = description;
          FirebaseFirestore.instance
              .collection('products')
              .doc('allproduct')
              .update({'productdetails': prod});
        }
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product updated successfully'),
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to update product'),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('products')
        .doc('allproduct')
        .get()
        .then((docSnapshot) {
      if (docSnapshot.exists) {
        List<dynamic> prod = docSnapshot.data()!['productdetails'];
        int index = prod.indexWhere((p) => p['id'] == widget.productId);
        if (index != -1) {
          _nameController.text = prod[index]['name'];
          _priceController.text = prod[index]['price'].toString();
          _imageUrlController.text = prod[index]['image'];
          _descriptionController.text = prod[index]['description'];
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(160.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Name'),
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Price'),
                controller: _priceController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Image URL'),
                controller: _imageUrlController,
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an image URL';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                controller: _descriptionController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  _submitForm();
                  // if (!_formKey.currentState!.validate()) {
                  //   return;
                  // }
                  // final name = _nameController.text;
                  // final price = double.parse(_priceController.text);
                  // final imageUrl = _imageUrlController.text;
                  // final description = _descriptionController.text;
                  // try {
                  //   await FirebaseFirestore.instance
                  //       .collection('products')
                  //       .doc('allproduct')
                  //       .get()
                  //       .then((docSnapshot) {
                  //     if (docSnapshot.exists) {
                  //       List<dynamic> prod =
                  //           docSnapshot.data()!['productdetails'];
                  //       int index =
                  //           prod.indexWhere((prod) => prod['name'] == name);
                  //       if (index != -1) {
                  //         prod[index] = {
                  //           'name': name,
                  //           'price': price,
                  //           'description': description,
                  //           'image': imageUrl,
                  //           'id': prod[index]['id']
                  //         };
                  //         FirebaseFirestore.instance
                  //             .collection('products')
                  //             .doc('allproduct')
                  //             .update({'productdetails': prod});
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(
                  //             content: Text('Product updated successfully'),
                  //           ),
                  //         );
                  //         // clear the form
                  //         _formKey.currentState!.reset();
                  //       } else {
                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(
                  //             content: Text('Product not found'),
                  //           ),
                  //         );
                  //       }
                  //     }
                  //   });
                  // } catch (error) {
                  //   // show error message
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     SnackBar(
                  //       content: Text('Failed to update product'),
                  //     ),
                  //   );
                  // }
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
