import 'package:combined_app/model/components/components.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResuableRow(
                imgUrl:
                    "https://img.freepik.com/free-photo/portrait-young-female-student-with-yellow-notebook-standing-gray-high-quality-photo_144627-73688.jpg",
                title: "Teachers"),
            ResuableRow(
                imgUrl:
                    "https://img.freepik.com/free-photo/portrait-young-female-student-with-yellow-notebook-standing-gray-high-quality-photo_144627-73688.jpg",
                title: "Students"),
            ResuableRow(
                imgUrl:
                    "https://img.freepik.com/free-photo/portrait-young-female-student-with-yellow-notebook-standing-gray-high-quality-photo_144627-73688.jpg",
                title: "Administration"),
          ],
        ),
      ),
    );
  }
}

class ResuableRow extends StatelessWidget {
  final String? title;
  final String? imgUrl;
  const ResuableRow({super.key, required this.title, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, '/students');
            },
            child: MyCard(imgUrl: imgUrl, title: title)),
        MyCard(imgUrl: imgUrl, title: title)
      ],
    );
  }
}
