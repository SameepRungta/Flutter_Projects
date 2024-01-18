import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: double.infinity,
                  width: 100,
                  color: Colors.white,
                  child: Text("Container 1"),
                ),
                Container(

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.lightBlue,
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        color: Colors.greenAccent,)
                    ],
                  ),
                ),

                Container(

                  height: double.infinity,
                  width: 100,
                  color: Colors.amber,
                  child: Text("Container 2"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


