// import 'package:combined_app/model/models/student.dart';
import 'dart:convert';

import 'package:combined_app/services/api_service.dart';
import 'package:combined_app/view_model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class TeachersListScreen extends StatelessWidget {
  const TeachersListScreen({super.key});
  Future<List<dynamic>> fetchDataFromJson() async {
    String jsonData = await rootBundle.loadString('assets/student_list.json');
    List<dynamic> data = json.decode(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers Directory'),
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
                      leading: Image.network(item['imageURL']),
                      title: Text(item['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email: ${item['email']}'),
                          Text('Phone: ${item['phone']}'),
                        ],
                      ),
                    );
                  });
            }
          }),
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
