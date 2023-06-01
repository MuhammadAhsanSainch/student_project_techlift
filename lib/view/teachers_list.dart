// import 'package:combined_app/model/models/student.dart';
import 'package:combined_app/services/api_service.dart';
import 'package:combined_app/view_model/student_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeachersListScreen extends StatelessWidget {
  const TeachersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final studentViewModel = Provider.of<StudentViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers Directory'),
      ),
      body: ListView.builder(
        itemCount: studentViewModel.students.length,
        itemBuilder: (context, index) {
          final student = studentViewModel.students[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text(student.email),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                studentViewModel.deleteStudent(student.id);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddStudentScreen()),
          );
        },
      ),
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
