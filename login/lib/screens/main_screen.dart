import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:SafeSphere/login_page.dart';
import 'package:SafeSphere/widgets/news_widget.dart';
import '../components/functions.dart';
import '../dashboard/bully.dart';
import '../services/chatbot.dart';
import 'components/side_menu.dart';
import 'package:SafeSphere/dashboard/incident_report.dart';
import 'package:SafeSphere/dashboard/community.dart';


class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(onTapRegister: () {})),
    );
  }

  void openreport(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IncidentReport()),
    );
  }

  void openbully(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => cyberbulling()),
    );
  }

  void opencom(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Community()),
    );
  }

  void opennew(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsWidget()),
    );
  }

  void openChat(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          ),
          child: ChatBox(userEmail: user.email!), // Replace with the actual user email
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar("SafeSphere"), // Replace with your actual app bar
      drawer: SideMenu(),

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RichText(
                text: TextSpan(
                  text: "Welcome! ",
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      text: "${user.email}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildCard(
                onTap: () => openreport(context),
                imagePath: 'images/box/box5.png',
                imageAssetPath: 'images/pic/img5.png',
                title: 'Incident Report',
                description:
                'Report cyberbullying, get expert support, track progress. Take charge of online safety. We\'re here to help!',
              ),
              const SizedBox(
                height: 15,
              ),
              _buildCard(
                onTap: () => opencom(context),
                imagePath: 'images/box/box2.png',
                imageAssetPath: 'images/pic/img6.png',
                title: 'Community Forum',
                description:
                'Overcome cyberbullying trauma with our counsellors. Chat for guidance, connect with domain experts. Start healing today!',
              ),
              const SizedBox(
                height: 15,
              ),
              _buildCard(
                onTap: () => openbully(context),
                imagePath: 'images/box/box3.png',
                imageAssetPath: 'images/pic/img7.png',
                title: 'All about Cyberbullying',
                description:
                'Expand knowledge on cyberbullying, its types, causes, impact. Test understanding with our quiz',
              ),
              const SizedBox(
                height: 15,
              ),
              _buildCard(
                onTap: () => opennew(context),
                imagePath: 'images/box/box1.png',
                imageAssetPath: 'images/pic/img8.png',
                title: 'CyberNews',
                description: 'Your One-Stop Source for Cybersecurity News',
              ),
            ],
          ),
        ),
      ),

      // Floating action button for the chat
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => openChat(context),
        child: Image.asset('images/cbot.png', width: 100, height: 100),
        backgroundColor: Colors.white, // Set the desired color
      ),
    );
  }

  Widget _buildCard({
    required VoidCallback onTap,
    required String imagePath,
    required String imageAssetPath,
    required String title,
    required String description,
  }) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(16),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13, // Decreased font size
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 15),
                child: Image.asset(
                  imageAssetPath,
                  height: 100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
