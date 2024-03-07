import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SafeSphere/components/com_post.dart';
import 'package:SafeSphere/screens/components/side_menu.dart';
import 'package:SafeSphere/components/functions.dart';

class Community extends StatefulWidget {
  static const String UserPostsCollection = "User Posts";

  const Community({Key? key}) : super(key: key);

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  Future<void> postMessage() async {
    try {
      if (textController.text.isNotEmpty) {
        await FirebaseFirestore.instance.collection(Community.UserPostsCollection).add({
          'UserEmail': currentUser.email,
          'Message': textController.text,
          'TimeStamp': Timestamp.now(),
        });

        bool atBottom = _scrollController.position.pixels == _scrollController.position.maxScrollExtent;

        Future.delayed(Duration(milliseconds: 500), () {
          if (atBottom) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          }
        });

        textController.clear();
      }
    } catch (e) {
      // Handle error, show a snackbar, toast, or log the error
      print('Error posting message: $e');
    }
  }

  // Function to check if two dates are the same
  bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  // Function to format date
  String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Function to format time
  String formatTime(DateTime time) {
    String formattedHour = time.hour.toString().padLeft(2, '0');
    String formattedMinute = time.minute.toString().padLeft(2, '0');
    return "$formattedHour:$formattedMinute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SafeSphere',
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              "Logged in as: " + currentUser.email!,
              style: GoogleFonts.poppins(fontSize: 8, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          IconButton(
            onPressed: () => navigateBack(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      drawer: SideMenu(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection(Community.UserPostsCollection)
                  .orderBy("TimeStamp", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Widget> chatWidgets = [];

                  DateTime? currentDate; // To track the current date

                  for (int index = snapshot.data!.docs.length - 1; index >= 0; index--) {
                    final post = snapshot.data!.docs[index];
                    final messageTime = (post['TimeStamp'] as Timestamp).toDate();
                    final isSameDay = currentDate != null && isSameDate(currentDate!, messageTime);

                    if (!isSameDay) {
                      currentDate = messageTime;
                      chatWidgets.insert(
                        0,
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          alignment: Alignment.center,
                          child: Text(
                            formatDate(messageTime),
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }

                    chatWidgets.insert(
                      0,
                      ComPost(
                        message: post['Message'],
                        user: post['UserEmail'],
                        isSent: post['UserEmail'] == currentUser.email,
                        time: formatTime(messageTime),
                      ),
                    );
                  }

                  return ListView(
                    reverse: true,
                    controller: _scrollController,
                    children: chatWidgets,
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: 'Write something on the field',
                          border: InputBorder.none,
                        ),
                        style: GoogleFonts.poppins(),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: postMessage,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
