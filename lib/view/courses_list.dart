import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class CoursesListScreen extends StatelessWidget {
  Future<List<dynamic>> fetchDataFromJson() async {
    String jsonData = await rootBundle.loadString('assets/course_list.json');
    List<dynamic> data = json.decode(jsonData);
    return data;
  }

  const CoursesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Courses List'),
      ),
      body: FutureBuilder<List<dynamic>>(
          future: fetchDataFromJson(),
          builder:
              (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else {
              List<dynamic> data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = data[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text("credit hours: ${item['credit_hours']}"),
                    );
                  });
            }
          }),
    );
  }
}
