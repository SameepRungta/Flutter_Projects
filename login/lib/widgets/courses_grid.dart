import 'package:login/data/data.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CourseGrid extends StatelessWidget {
  const CourseGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: course.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 16 / 7, crossAxisCount: 1, mainAxisSpacing: 20),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(course[index].backImage), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          course[index].text,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold, // Set the text to bold
                            fontSize: 18.0, // Set the font size to your desired value
                          ),
                        )
                    ,
                        Text(

                          course[index].lessons,
                          textAlign: TextAlign.left,
                          style: const TextStyle(color: Colors.white),
                        ),
                        // CircularPercentIndicator(
                        //   radius: 30,
                        //   lineWidth: 8,
                        //   animation: true,
                        //   animationDuration: 1500,
                        //   circularStrokeCap: CircularStrokeCap.round,
                        //   percent: course[index].percent / 100,
                        //   progressColor: Colors.white,
                        //   center: Text(
                        //     // "${course[index].percent}%",
                        //     style: const TextStyle(color: Colors.white),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        course[index].imageUrl,
                        height: 110,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
