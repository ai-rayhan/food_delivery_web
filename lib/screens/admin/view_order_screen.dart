import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

import '../../provider/orders.dart';

class ViewOrders extends StatefulWidget {
  ViewOrders({Key? key}) : super(key: key);

  @override
  State<ViewOrders> createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: FutureBuilder(
        future: Provider.of<Orders>(context).getOrderLength(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('An Error occurred');
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ExpansionTile(
                      title: Text(
                        'Order No ${index + 1}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount:
                                snapshot.data.values.toList()[index].length,
                            itemBuilder: (BuildContext context, int iindex) {
                              return Card(
                                elevation: 2,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                child: ExpansionTile(
                                  title: Text(
                                    snapshot.data.values
                                        .toList()[index]
                                        .values
                                        .toList()[iindex]['products'][0]
                                            ['title']
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          ListTile(
                                            leading: CircleAvatar(
                                              child: Text(snapshot.data.values
                                                  .toList()[index]
                                                  .values
                                                  .toList()[iindex]
                                                      ['paymentstatus']
                                                  .toString()),
                                            ),
                                            title: Text(
                                              '${snapshot.data.values.toList()[index].values.toList()[iindex]['details'].toString()}',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                            trailing: Text(
                                              '${snapshot.data.values.toList()[index].values.toList()[iindex]['products'][0]['price'].toString()}X${snapshot.data.values.toList()[index].values.toList()[iindex]['products'][0]['quantity'].toString()}',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'Additional Product Details:',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics: ClampingScrollPhysics(),
                                            itemCount: snapshot.data.values
                                                    .toList()[index]
                                                    .values
                                                    .toList()[iindex]
                                                        ['products']
                                                    .length -
                                                1,
                                            itemBuilder: (BuildContext context,
                                                int ijindex) {
                                              final product = snapshot
                                                      .data.values
                                                      .toList()[index]
                                                      .values
                                                      .toList()[iindex]
                                                  ['products'][ijindex + 1];
                                              return ListTile(
                                                leading: CircleAvatar(
                                                  child: Text(
                                                      product['paymentstatus']
                                                          .toString()),
                                                ),
                                                title: Text(
                                                  '${product['title'].toString()}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                trailing: Text(
                                                  '${product['price'].toString()}X${product['quantity'].toString()}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
