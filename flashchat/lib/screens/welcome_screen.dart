import 'dart:async';
import 'package:flashchat/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'roundbutton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          // Center the content horizontally
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 65, // Adjust size based on animation value
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    // width: animation.value * 200, // Adjust width based on animation value
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Flash Chat',
                          speed: Duration(milliseconds: 150),
                          textStyle: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Roundbutton(
                  colors: Colors.lightBlueAccent,
                  title: "Login in",
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  }),
              // Add some spacing

              Roundbutton(
                  colors: Colors.blueAccent,
                  title: "Register",
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  }),

            ],
          ),
        ),
      ),
    );
  }
}


