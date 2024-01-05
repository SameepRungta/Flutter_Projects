import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.amber,
              Colors.white
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight
          ),
        ),
        child: const Center(
          child: Text('Hello, World!'),
        ),
      ),
    ),
  ));
}
