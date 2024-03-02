import 'package:flutter/material.dart';
import 'package:login/screens/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void navigateBack(BuildContext context) {
  Navigator.pop(context);
}

class CustomAppBar extends AppBar {
  CustomAppBar(String title)
      : super(
    actions: [
      Container(
        padding: EdgeInsets.only(right: 10, bottom: 10),
        height: 60,
        child: Image(image: AssetImage('images/safespherewhite.png')),
      ),
    ],
    title: Text(
      title,
      style: GoogleFonts.josefinSans(
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.black,
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.grey, size: 28),
  );
}