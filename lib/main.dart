import 'package:flutter/material.dart';

void main() {
  runApp(myApp);
}

Widget myApp=MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Ana Sayfa"),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications_none_outlined),
              onPressed: () {
                print("Search button clicked");
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                print("More button clicked");
              },
            ),
          ],
        ),
        drawer: Drawer(),
      ),
    ),
