import 'package:login/constant.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../model/course_model.dart';
import '../model/planing_model.dart';
import '../model/statistics_model.dart';

final List<Course> course = [
  Course(
      text: "Report an Incident",
      lessons: "Report cyberbullying, get expert support, track progress. Take charge of online safety. We're here to help!",
      imageUrl: "images/pic/img1.png",
   
      backImage: "images/box/box1.png",
      color: kDarkBlue),
  Course(
      text: "Community Forum",
      lessons: "Overcome cyberbullying trauma with our counsellors. Chat for guidance, connect with domain experts. Start healing today!",
      imageUrl: "images/pic/img2.png",
      
      backImage: "images/box/box2.png",
      color: kOrange),
  Course(
      text: "All about Cyberbulling",
      lessons: "Expand knowledge on cyberbullying, its types, causes, impact. Test understanding with our quiz",
      imageUrl: "images/pic/img3.png",
      
      backImage: "images/box/box3.png",
      color: kGreen),
  Course(
      text: "Cyber Safety",
      lessons: "Stay updated on cybercrime trends and safety practices. Access resources, workshops. Let's create a safer online environment.",
      imageUrl: "images/pic/img4.png",
      
      backImage: "images/box/box4.png",
      color: kYellow),
];

final List<Planing> planing = [
  Planing(
    heading: "Reading-Begineer Toipc 1",
    subHeading: "8:00 AM - 10:00 AM",
    color: kLightBlue,
    icon: const Icon(
      Icons.menu_book_outlined,
      color: kDarkBlue,
    ),
  ),
  Planing(
    heading: "Listening - Intermediate Topic 1",
    subHeading: "03:00 PM - 04:00 PM",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      TernavIcons.lightOutline.hedphon,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Speaking - Beginner Topic 1",
    subHeading: "8:00 AM - 12:00 PM",
    color: const Color(0xffF9F0D3),
    icon: Icon(TernavIcons.lightOutline.volume_low, color: kYellow),
  ),
  Planing(
    heading: "Grammar - Intermediate Topic 2",
    subHeading: "8:00 AM - 12:00 PM",
    color: const Color(0xffF9E5D2),
    icon: Icon(
      TernavIcons.lightOutline.edit,
      color: kOrange,
    ),
  ),
  Planing(
    heading: "Listening - Intermediate Topic 1",
    subHeading: "8:00 AM - 12:00 PM",
    color: const Color(0xffE2EDD2),
    icon: Icon(
      TernavIcons.lightOutline.hedphon,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Grammar - Intermediate Topic 2",
    subHeading: "8:00 AM - 12:00 PM",
    color: const Color(0xffF9E5D2),
    icon: Icon(
      TernavIcons.lightOutline.edit,
      color: kOrange,
    ),
  ),
  Planing(
    heading: "Speaking - Beginner Topic 1",
    subHeading: "07:00 PM - 08:00 PM",
    color: const Color(0xffF9F0D3),
    icon: Icon(TernavIcons.lightOutline.volume_low, color: kYellow),
  ),
  Planing(
    heading: "Reading-Begineer Toipc 1",
    subHeading: "01:00 PM - 02:00 PM",
    color: kLightBlue,
    icon: const Icon(
      Icons.menu_book_outlined,
      color: kDarkBlue,
    ),
  ),
];

final List<Statistics> statistics = [
  Statistics(
    title: "Course Completed",
    number: "02",
  ),
  Statistics(
    title: "Total Points Gained",
    number: "250",
  ),
  Statistics(
    title: "Course In Progress ",
    number: "03",
  ),
  Statistics(
    title: "Tasks \nFinished",
    number: "05",
  )
];
