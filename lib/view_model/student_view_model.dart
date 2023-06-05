import 'package:combined_app/services/api_service.dart';
import 'package:flutter/foundation.dart';

class StudentViewModel extends ChangeNotifier {
  final ApiService apiService;

  List<Student> _students = [];
  List<Student> get students => _students;

  StudentViewModel({required this.apiService}) {
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      _students = await apiService.getStudents();
      notifyListeners();
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error fetching students: $e');
      }
    }
  }

  Future<void> addStudent(Student student) async {
    try {
      final addedStudent = await apiService.addStudent(student);
      _students.add(addedStudent);
      notifyListeners();
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error adding student: $e');
      }
    }
  }

  Future<void> updateStudent(Student student) async {
    try {
      final updatedStudent = await apiService.updateStudent(student);
      final index = _students.indexWhere((s) => s.id == student.id);
      if (index >= 0) {
        _students[index] = updatedStudent;
        notifyListeners();
      }
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error updating student: $e');
      }
    }
  }

  Future<void> deleteStudent(String studentId) async {
    try {
      await apiService.deleteStudent(studentId);
      _students.removeWhere((student) => student.id == studentId);
      notifyListeners();
    } catch (e) {
      // Handle error
      if (kDebugMode) {
        print('Error deleting student: $e');
      }
    }
  }
}




// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class StudentViewModel extends ChangeNotifier {
//   int? _id;
//   String? _name;
//   String? _email;
//   String? _mobile;
//   String? _password;

//   int? get id => _id;
//   String? get name => _name;
//   String? get email => _email;
//   String? get mobile => _mobile;
//   String? get password => _password;

//   void updateStudent(
//       {int? id,
//       String? name,
//       String? email,
//       String? mobile,
//       String? password}) {
//     _id = id ?? _id;
//     _name = name ?? _name;
//     _email = email ?? _email;
//     _mobile = mobile ?? _mobile;
//     _password = password ?? _password;

//     notifyListeners();
//   }

//   Future<void> fetchStudentData() async {
//     try {
//       final response =
//           await http.get(Uri.parse('http://192.168.1.12:3000/api/v1/user-get'));
//       if (response.statusCode == 200) {
//         final studentData = jsonDecode(response.body);
//         _id = studentData['id'];
//         _name = studentData['name'];
//         _email = studentData['email'];
//         _mobile = studentData['mobile'];
//         _password = studentData['password'];
//         notifyListeners();
//       } else {
//         throw Exception('Failed to fetch student data!');
//       }
//     } catch (error) {
//       throw Exception('Error: $error');
//     }
//   }
// }
