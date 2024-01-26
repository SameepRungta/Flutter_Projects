import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

void playsound(int soundnumber)
{

  final player = AudioPlayer(); // Create a player
  player.setAsset('assets/note$soundnumber.wav'); // Replace with your asset path
  player.play();

}

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
           
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                          
                  color: Colors.red.shade600,
                  child: TextButton(
                    onPressed: () async {
                      playsound(1);
                    },
                    child: Text(''),
                  ),
                ),
              ),
              
              Expanded(
                child: Container(
                          
                  color: Colors.orange,
                  child: TextButton(
                    onPressed: () async {
                      playsound(2);
                    },
                    child: Text(' '),
                  ),
                ),
              ),
         
              Expanded(
                child: Container(
                          
                  color: Colors.amber,
                  child: TextButton(
                    onPressed: () async {
                      playsound(3);
                    },
                    child: Text(' '),
                  ),
                ),
              ),
             
              Expanded(
                child: Container(
                          
                  color: Colors.green,
                  child: TextButton(
                    onPressed: () async {
                      playsound(4);
                    },
                    child: Text(' '),
                  ),
                ),
              ),
              
              Expanded(
                child: Container(
                          
                  color: Colors.blue.shade800,
                  child: TextButton(
                    onPressed: () async {
                      playsound(5);
                    },
                    child: Text(' '),
                  ),
                ),
              ),
              
              Expanded(
                child: Container(
                          
                  color: Colors.grey.shade300,
                  child: TextButton(
                    onPressed: () async {
                      playsound(6);
                    },
                    child: Text(' '),
                  ),
                ),
              ),
              
              Expanded(
                child: Container(
                          
                  color: Colors.purple,
                  child: TextButton(
                    onPressed: () async {
                      playsound(7);
                    },
                    child: Text(' '),
                  ),
                ),
              ),
              // Add more containers and TextButtons for other local audio files if needed
            ],
          ),
        ),
      ),
    );
  }
}
