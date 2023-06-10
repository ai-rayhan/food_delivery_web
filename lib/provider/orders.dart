import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;
  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.datetime,
  });
}

class Orders with ChangeNotifier {
  Orders(
    this.authToken,
    this._orders,
  );
  var authToken;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

// implement fatch and set order using map  in # screen/order screen.dart implement order data ,check line 17-25
  Future<void> fetchAndSetOrders() async {
    final url = Uri.parse(
        'https://food-delivery-56a3c-default-rtdb.firebaseio.com/orders/$userId.json');
    final response = await http.get(url);
    final List<OrderItem> loadedOrders = [];
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      return;
    }
    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        OrderItem(
          id: orderId,
          amount: orderData['amount'],
          datetime: DateTime.parse(orderData['datetime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => CartItem(
                  id: item['id'],
                  price: item['price'],
                  quantity: item['quantity'],
                  title: item['title'],
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

// implement add order using map in # screen/cart screen.dart implement order data line 92-94

  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url = Uri.parse(
        'https://food-delivery-56a3c-default-rtdb.firebaseio.com/orders/$userId.json');
    final timestamp = DateTime.now();
    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'datetime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );
    _orders.insert(
      0,
      OrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        datetime: timestamp,
        products: cartProducts,
      ),
    );
    print(userId);
    notifyListeners();
  }
}
