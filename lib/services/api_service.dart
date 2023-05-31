import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://example.com/api'; // Replace with your API base URL

  // Method to fetch students
  Future<List<Student>> getStudents() async {
    final response = await http.get(Uri.parse('$baseUrl/students'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch students');
    }
  }

  // Method to add a student
  Future<Student> addStudent(Student student) async {
    final response = await http.post(
      Uri.parse('$baseUrl/students'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(student.toJson()),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return Student.fromJson(data);
    } else {
      throw Exception('Failed to add student');
    }
  }

  // Method to update a student
  Future<Student> updateStudent(Student student) async {
    final response = await http.put(
      Uri.parse('$baseUrl/students/${student.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(student.toJson()),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Student.fromJson(data);
    } else {
      throw Exception('Failed to update student');
    }
  }

  // Method to delete a student
  Future<void> deleteStudent(String studentId) async {
    final response =
        await http.delete(Uri.parse('$baseUrl/students/$studentId'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete student');
    }
  }
}

class Student {
  final String id;
  final String name;
  final String email;

  Student({
    required this.id,
    required this.name,
    required this.email,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
