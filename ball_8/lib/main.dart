import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(
      MaterialApp(
        home: BallPage(),
      ),
    );

class BallPage extends StatelessWidget {
  const BallPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Center(
          child: Text(
            "Ask me Anything",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;
  @override
  Widget build(BuildContext context) {


    void onClick() {
      setState(() {
        ballNumber = Random().nextInt(5) + 1;
      });
    }

    return Center(
      child: TextButton(
        onPressed: () {
          print("I got Clicked");
          onClick();
        },

        child: Image.asset("images/ball$ballNumber.png"),
      ),
    );
  }
}
