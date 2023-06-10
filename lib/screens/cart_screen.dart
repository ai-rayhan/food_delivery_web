import 'package:flutter/material.dart';
import 'package:food_delivery_web/screens/orders_screen.dart';
import 'package:provider/provider.dart';

import '../provider/orders.dart';
import '../widgets/cart_item.dart' as ci;

import '../provider/cart.dart' show Cart;

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool bkash = false;

  var cod = true;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                  Chip(
                    label: Text('\$${cart.totalAmaount.toStringAsFixed(2)}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                       OrderButton(cart: cart, isCOD: bkash == false?true:false,)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextFormField(
              controller: mycontroller,
              decoration: const InputDecoration(
                hintText: 'Ex: Name,Phone,Address',
                border: UnderlineInputBorder(),
                labelText: 'Enter delivery details',
              ),
            ),
          ),
          if (bkash == true || cod == false)
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: mycontroller2,
                decoration: const InputDecoration(
                  hintText: 'Ex: w327gdfe772f3',
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your transection id',
                ),
              ),
            )
          else
            Container(),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Checkbox(
                        value: cod,
                        onChanged: (valuen) {
                          setState(() {
                            cod = valuen!;
                            // bkash = valuen!;
                            bkash = !valuen;
                          });
                        }),
                    Container(
                      child: const Text("Cash on Delivery"),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Checkbox(
                        value: bkash,
                        onChanged: (value) {
                          setState(() {
                            bkash = value!;
                            // cod = value;
                            cod = !value;
                          });
                        }),
                    Container(
                      child: const Text("Bkash"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount,
              itemBuilder: (context, i) => ci.CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextEditingController mycontroller = TextEditingController();
TextEditingController mycontroller2 = TextEditingController();

class OrderButton extends StatefulWidget {
   OrderButton({
    Key? key,
    required this.cart,
    required this.isCOD,
  }) : super(key: key);

  final Cart cart;
  bool isCOD;

  @override
  _OrderButtonState createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: _isLoading ? CircularProgressIndicator() : Text('ORDER NOW'),
      onPressed: (widget.cart.totalAmaount <= 0 || _isLoading)
          ? null
          : () async {
              setState(() {
                _isLoading = true;
              });
              if (mycontroller.text == ''||widget.isCOD==false?mycontroller2.text=='':mycontroller.text=='') {
                print('object');
                setState(() {
                  _isLoading = false;
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter Information correctly')));
                });
                return;
              } else {
                await Provider.of<Orders>(context, listen: false).addOrder(
                  widget.cart.items.values.toList(),
                  widget.cart.totalAmaount,
                  mycontroller.text,
                  mycontroller2.text==''?'Not paid':mycontroller2.text,
                  widget.isCOD?"COD":mycontroller2.text,
                );
              }
              setState(() {
                _isLoading = false;
              });
              widget.cart.clear();
              mycontroller.clear();
              mycontroller2.clear();
              // Navigator.of(context).pushReplacement(
              //   // CustomRoute(
              //   //   builder: (context) => OrdersScreen(),
              //   // ),
              // );
            },
      // textColor: Theme.of(context).primaryColor,
    );
  }
}
