import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentsDetailScreen extends StatefulWidget {
  const StudentsDetailScreen({super.key});

  @override
  State<StudentsDetailScreen> createState() => _StudentsDetailScreenState();
}

class _StudentsDetailScreenState extends State<StudentsDetailScreen> {
  Future<List<dynamic>> fetchDataFromJson() async {
    String jsonData = await rootBundle.loadString('assets/student_detail.json');
    List<dynamic> data = json.decode(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
            future: fetchDataFromJson(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error ${snapshot.error}');
              } else {
                final data = snapshot.data;
                return Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        child: Image.network(''),
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
