import 'package:flutter/material.dart';
import 'package:hero_animation/hero_animation.dart';
import 'roundbutton.dart';
import 'package:flashchat/constants.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'RegistrationScreen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override

  late String email;
  late String password;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
                decoration: kTextfield.copyWith(hintText: "Enter your email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password = value;
              },
                decoration: kTextfield.copyWith(hintText: "Enter your password")
            ),
            SizedBox(
              height: 24.0,
            ),
            Roundbutton(
                colors: Colors.blueAccent,
                title: "Register",
                onPressed: () {
                  print(email);
                  print(password);
                }),
          ],
        ),
      ),
    );
  }
}
