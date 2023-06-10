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
        // drawer: AppDrawer(),
        body: FutureBuilder(
          future: Provider.of<Orders>(context).getOrderLength(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text('An Error occurred');
              } else {
                print(snapshot.data);
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SingleChildScrollView(
                      child: ExpansionTile(
                        title: Text('Order No ${index + 1}'),
                        children: [
                          Container(
                            height: 500,
                            child: ListView.builder(
                              itemCount:
                                  snapshot.data.values.toList()[index].length,
                              itemBuilder: (BuildContext context, int iindex) {
                                return Container(
                                  height: (double.parse(snapshot.data.values
                                          .toList()[index]
                                          .values
                                          .toList()[iindex]['products']
                                          .length
                                          .toString()) *
                                      70),
                                  child: ListView.builder(
                                    itemCount: snapshot.data.values
                                        .toList()[index]
                                        .values
                                        .toList()[iindex]['products']
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int ijindex) {
                                      return Card(
                                        child: ExpansionTile(
                                          title: Text(
                                            snapshot.data.values
                                                .toList()[index]
                                                .values
                                                .toList()[iindex]['products']
                                                    [ijindex]['title']
                                                .toString(),
                                          ),
                                          children: [
                                            Container(
                                                // height: 100,
                                                child: ListTile(
                                              leading: CircleAvatar(
                                                child: Text(snapshot.data.values
                                                    .toList()[index]
                                                    .values
                                                    .toList()[iindex]
                                                        ['paymentstatus']
                                                    .toString()),
                                              ),
                                              title: Text(
                                                  '${snapshot.data.values.toList()[index].values.toList()[iindex]['details'].toString()}'),
                                              trailing: Text(
                                                  '${snapshot.data.values.toList()[index].values.toList()[iindex]['products'][ijindex]['price'].toString()}X${snapshot.data.values.toList()[index].values.toList()[iindex]['products'][ijindex]['quantity'].toString()}'),
                                            ))
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    );
                    // ListTile(
                    //   leading: Icon(Icons.verified_user),
                    //   title:
                    //       Text(snapshot.data.values.toList()[index].toString()),
                    // );
                  },
                );
              }
            } else {
              return Container();
            }
          },
        ));
  }
}
