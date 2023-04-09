import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUD extends StatefulWidget {
  const CRUD({super.key});

  @override
  State<CRUD> createState() => _CRUDState();
}

class _CRUDState extends State<CRUD> {

  TextEditingController link = TextEditingController();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          TextField(
            controller: link,
            decoration: InputDecoration(hintText: 'Enter link'),
          ),
          ElevatedButton(
              onPressed: () async {
                if (link.text != '') {
                  await FirebaseFirestore.instance
                      .collection('data')
                      .doc('test')
                      .get()
                      .then((docSnapshot) {
                    if (docSnapshot.exists) {
                      FirebaseFirestore.instance
                          .collection('data')
                          .doc('crud')
                          .delete();
                    }
                  });
print("Link added");                  link.clear();
                } else {
print('enter valid link');                }
              },
              child: Text('Update'))
        ]),
      ),
    );
  }
}