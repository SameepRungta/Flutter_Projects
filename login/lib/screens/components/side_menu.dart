import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';
import 'package:login/login_page.dart';
import '../../constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/screens/main_screen.dart';
import 'package:login/services/auth_service.dart';

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
                child: Image.asset(
              "images/spherelogo.png",
            )),
          ),
        DrawerListTile(
          icon: TernavIcons.lightOutline.home_2,
          title: "DashBoard",
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          },
        ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.danger,
            title: "Report Incident",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.collateral,
            title: "Seek Help",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.message,
            title: "Community",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.info,
            title: "About Us",
            onTap: () {},
          ),
          DrawerListTile(
            icon: TernavIcons.lightOutline.mobile,
            title: "Contact Us",
            onTap: () {},
          ),
      DrawerListTile(
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
          // Container(
          //   height: 100,
          //   margin: const EdgeInsets.all(24),
          //   padding: const EdgeInsets.all(defaultPadding),
          //   decoration: BoxDecoration(
          //       color: kLightBlue, borderRadius: BorderRadius.circular(15)),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     mainAxisAlignment: MainAxisAlignment.spaceAround,
          //     children: [
          //       const Text("Upgrade your plan",
          //           style: TextStyle(fontWeight: FontWeight.bold)),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text("Go to Pro", style: TextStyle(color: kDarkBlue)),
          //           InkWell(
          //             onTap: () {},
          //             child: Container(
          //               height: 30,
          //               width: 30,
          //               decoration: BoxDecoration(
          //                 border: Border.all(color: kDarkBlue),
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: const Icon(
          //                 Icons.keyboard_double_arrow_right_rounded,
          //                 color: kDarkBlue,
          //               ),
          //             ),
          //           )
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
