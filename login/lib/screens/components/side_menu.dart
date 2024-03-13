import 'package:SafeSphere/dashboard/Aboutus.dart';
import 'package:flutter/material.dart';
import 'package:SafeSphere/widgets/news_widget.dart';
import 'package:ternav_icons/ternav_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:SafeSphere/screens/main_screen.dart';
import 'package:SafeSphere/dashboard/incident_report.dart';
import 'package:SafeSphere/dashboard/community.dart';
import 'package:SafeSphere/services/auth_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:SafeSphere/dashboard/Aboutus.dart';

class SideMenu extends StatelessWidget {
  final Function()? onTapRegister;
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut(BuildContext context) async {
    await AuthService().signOutGoogle(); // Sign out Google first
    await FirebaseAuth.instance.signOut(); // Sign out Firebase
  }

  SideMenu({
    Key? key,
    this.onTapRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      child: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            height: 150,
            child: DrawerHeader(
              child: Image.asset("images/safesphere3.png"),
            ),
          ),
          drawerListTile(
            icon: TernavIcons.lightOutline.home_2,
            title: "DashBoard",
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
          drawerListTile(
            icon: TernavIcons.lightOutline.danger,
            title: "Report Incident",
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IncidentReport()),
              );
            },
          ),
          drawerListTile(
            icon: TernavIcons.lightOutline.message,
            title: "Community",
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Community()),
              );
            },
          ),
          drawerListTile(
            icon: TernavIcons.lightOutline.info,
            title: "CyberNews",
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsWidget()),
              );
            },
          ),
          drawerListTile(
            icon: TernavIcons.lightOutline.collateral,
            title: "Seek Help",
            onTap: () {
              launch("https://www.cybercrime.gov.in/");
            },
          ),

          drawerListTile(
            icon: TernavIcons.lightOutline.mobile,
            title: "About Us",
            onTap: () {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Aboutus()),
              );
            },
          ),
          drawerListTile(
            icon: TernavIcons.lightOutline.logout,
            title: "Logout",
            onTap: () => signUserOut(context),
          ),
          const SizedBox(
            height: 60,
          ),
          Image.asset(
            "images/help.png",
            height: 150,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }


  ListTile drawerListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: Colors.grey,
        size: 18,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
