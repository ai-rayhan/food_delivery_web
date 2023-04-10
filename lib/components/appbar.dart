import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.1,
      backgroundColor: Colors.deepOrange,
      title: Text(
        "Foodie",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
      actions: [
        TextButton(
          onPressed: () {},
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Review",
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "FAQ",
            style: TextStyle(color: Colors.white),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}
