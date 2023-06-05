import 'package:combined_app/view/signin.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final Map<String, String> dashboardItems = {
    'Students': 'images/students.jpg',
    'Teachers': 'images/teacher.jpg',
    'Courses': 'images/courses.png',
    'Application': 'images/application.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: GridView.builder(
              itemCount: dashboardItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,
                        '/${dashboardItems.keys.toList()[index].toLowerCase()}');
                  },
                  child: Card(
                      child: Column(
                    children: [
                      Image.asset(
                          dashboardItems[dashboardItems.keys.toList()[index]]!,
                          fit: BoxFit.cover),
                      SizedBox(
                        height: context.height * .02,
                      ),
                      Text(dashboardItems.keys.toList()[index]),
                    ],
                  )),
                );
              })),
    );
  }
}
