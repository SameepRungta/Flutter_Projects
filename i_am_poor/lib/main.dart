import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("I AM POOR", style: TextStyle(color:Colors.white),),
          backgroundColor: Colors.amber[400],
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.amber, Colors.white],
              begin: Alignment.bottomRight,
              end: Alignment.topRight,
            ),
          ),
          child: Center(
            child: Image(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/128/2047/2047278.png"),
            ),
          ),
        ),
      ),
    ),
  );
}
