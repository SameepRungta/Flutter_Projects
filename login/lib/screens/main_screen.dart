import 'package:login/screens/components/chart_container.dart';
import 'package:login/widgets/activity_header.dart';
import 'package:login/widgets/bar_chart.dart';
import 'package:login/widgets/courses_grid.dart';
import 'package:login/widgets/planing_grid.dart';
import 'package:login/widgets/statistics_grid.dart';
import 'package:flutter/material.dart';
import 'package:login/login_page.dart';
import '../constant.dart';
import '../widgets/planing_header.dart';
import 'components/side_menu.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatelessWidget {
   MainScreen({Key? key}) : super(key: key);


   final user = FirebaseAuth.instance.currentUser!;

   void signUserOut(BuildContext context) {
   FirebaseAuth.instance.signOut();
   Navigator.pushReplacement(
   context,
   MaterialPageRoute(builder: (context) => LoginPage(onTapRegister: () {})),
   );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.grey, size: 28),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.grey,
          //   ),
          // ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.grey,
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 5, right: 16, bottom: 5),
          //   child: const CircleAvatar(
          //     backgroundImage: NetworkImage(
          //         "https://images.unsplash.com/photo-1500522144261-ea64433bbe27?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTh8fHdvbWVufGVufDB8MHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
          //   ),
          // )
        ],
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          RichText(
          text: TextSpan(
          text: "Hello ",
            style: TextStyle(color: kDarkBlue, fontSize: 20),
            children: [
              TextSpan(
                text: "${user.email}",
                style: TextStyle(
                  color: kDarkBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ", welcome back!",
              ),
            ],
          ),
        ),

              const SizedBox(
                height: 15,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: const [
              //     Text(
              //       "My Courses",
              //       style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              //     ),
              //     Text(
              //       "View All",
              //       style: TextStyle(color: kDarkBlue),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 15,
              ),
              const CourseGrid(),
              const SizedBox(
                height: 20,
              ),
              const PlaningHeader(),
              const SizedBox(
                height: 15,
              ),
              const PlaningGrid(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Statistics",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const StatisticsGrid(),
              const SizedBox(
                height: 15,
              ),
              const ActivityHeader(),
              const ChartContainer(chart: BarChartContent())
            ],
          ),
        ),
      ),
    );
  }
}
