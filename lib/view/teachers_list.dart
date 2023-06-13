// import 'package:combined_app/model/models/student.dart';
import 'dart:convert';

import 'package:combined_app/services/api_service.dart';
import 'package:combined_app/view/teachers_detail.dart';
import 'package:combined_app/view_model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeachersListScreen extends StatefulWidget {
  const TeachersListScreen({super.key});

  @override
  State<TeachersListScreen> createState() => _TeachersListScreenState();
}

class _TeachersListScreenState extends State<TeachersListScreen> {
  List<dynamic>? filteredData;
  String searchValue = '';
  final TextEditingController _searchController = TextEditingController();

  Future<List<dynamic>> fetchDataFromJson() async {
    String jsonData =
        await rootBundle.loadString('assets/instructor_detail.json');
    List<dynamic> data = json.decode(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers Directory'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  searchValue = value;
                });
              },
              decoration: const InputDecoration(
                  labelText: "Search",
                  hintText: "Search Teachers",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
                future: fetchDataFromJson(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<dynamic>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error ${snapshot.error}');
                  } else {
                    List<dynamic> dataList = snapshot.data!;
                    List<dynamic> filteredData = dataList
                        .where((item) => item['name']
                            .toString()
                            .toLowerCase()
                            .contains(searchValue.toLowerCase()))
                        .toList();
                    return ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (BuildContext context, int index) {
                          final item = filteredData[index];
                          return ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          TeachersDetailScreen(
                                            id: item["id"],
                                            name: item["name"],
                                            image: item["imageURL"],
                                            email: item["email"],
                                            phone: item["phone"],
                                            courseId: item["courses"][0]["id"],
                                            courseName: item["courses"][0]
                                                ["name"],
                                            creditHours: item["courses"][0]
                                                ["credit_hours"],
                                          )));
                            },
                            leading: Image.asset(
                              item['imageURL'],
                              width: 80,
                              height: 150,
                            ),
                            title: Text(
                              item['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email: ${item['email']}'),
                                Text('Phone: ${item['phone']}'),
                                Text('Batch Year: ${item['batch_year']}'),
                              ],
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
//       // floatingActionButton: FloatingActionButton(
//       //   child: const Icon(Icons.add),
//       //   onPressed: () {
//       //     Navigator.push(
//       //       context,
//       //       MaterialPageRoute(builder: (context) => AddStudentScreen()),
//       //     );
//       //   },
//       // ),
    );
  }
}

class AddStudentScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentViewModel = Provider.of<StudentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                final name = _nameController.text;
                final email = _emailController.text;

                if (name.isNotEmpty && email.isNotEmpty) {
                  final newStudent = Student(
                    id: '',
                    name: name,
                    email: email,
                  );

                  studentViewModel.addStudent(newStudent);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
