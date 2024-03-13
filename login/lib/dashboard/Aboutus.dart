import 'package:flutter/material.dart';
import 'package:SafeSphere/components/functions.dart';
import 'package:SafeSphere/screens/components/side_menu.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar("SafeSphere"),
      drawer: SideMenu(),
      body: SafeArea(
        child: Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/about.png"), // Replace with the actual path to your image
                fit: BoxFit.fill, // Adjust the fit based on your requirements
              ),
            ),
        ),
      )
    );

  }
}
