import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Image(
            image: AssetImage("images/diamond.png"),
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
