import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TeachersDetailScreen extends StatefulWidget {
  const TeachersDetailScreen({super.key});
  Future<List<dynamic>> fetchDataFromJson() async {
    String jsonData = await rootBundle.loadString('assets/instructor_detail.json');
    List<dynamic> data = json.decode(jsonData);
    return data;
  }
  @override
  State<TeachersDetailScreen> createState() => _TeachersDetailScreenState();
}

class _TeachersDetailScreenState extends State<TeachersDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
