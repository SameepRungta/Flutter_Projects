import 'package:flutter/material.dart';

class ComPost extends StatelessWidget {
  final String message;
  final String user;
  final bool isSent;
  final String time;

  const ComPost({
    Key? key,
    required this.message,
    required this.user,
    required this.isSent,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        child: Column(
          crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: isSent ? Colors.blue : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: isSent ? Radius.circular(16.0) : Radius.circular(4.0),
                  topRight: isSent ? Radius.circular(4.0) : Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user,
                    style: TextStyle(
                      color: isSent ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    message,
                    style: TextStyle(
                      color: isSent ? Colors.white : Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 4.0),
                ],
              ),
            ),
            Container(
              alignment: isSent ? Alignment.bottomRight : Alignment.bottomLeft,
              padding: EdgeInsets.only(right: isSent ? 12.0 : 0.0, left: isSent ? 0.0 : 12.0),
              child: Text(
                time,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
