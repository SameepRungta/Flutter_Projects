import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Image(
            image: NetworkImage("https://th.bing.com/th/id/OIP.wKwptgE805PVLc_rzngaSQHaDt?rs=1&pid=ImgDetMain"),
          ),
        ),
        appBar:  AppBar(
          title: const Text("I am Rich",),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[900],
        ),
      ),
    ),
  );
}
