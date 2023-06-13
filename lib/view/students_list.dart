import 'dart:convert';

import 'package:combined_app/view/students_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StudentsListScreen extends StatefulWidget {
  const StudentsListScreen({super.key});

  @override
  State<StudentsListScreen> createState() => _StudentsListScreenState();
}

class _StudentsListScreenState extends State<StudentsListScreen> {
  List<dynamic>? filteredData;
  String searchValue = '';
  final TextEditingController _searchController = TextEditingController();

  // Future<List<dynamic>> fetchDataFromJson() async {
  //   String jsonData = await rootBundle.loadString('assets/student_list.json');
  //   List<dynamic> data = json.decode(jsonData);
  //   return data;
  // }
  Future<List<dynamic>> fetchDataFromJson() async {
    String jsonData = await rootBundle.loadString('assets/student_detail.json');
    List<dynamic> data = json.decode(jsonData);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Directory'),
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
                  hintText: "Search Students",
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
                                          StudentsDetailScreen(
                                              name: snapshot.data![index]
                                                  ["name"],
                                              image: snapshot.data![index]
                                                  ["imageURL"],
                                              email: snapshot.data![index]
                                                  ["email"],
                                              phone: snapshot.data![index]
                                                  ["phone"],
                                              batchYear: snapshot.data![index]
                                                  ["batch_year"])));
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

// class AddStudentScreen extends StatelessWidget {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();

//   AddStudentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final studentViewModel = Provider.of<StudentViewModel>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Student'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             TextField(
//               controller: _emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             const SizedBox(height: 16.0),
//             ElevatedButton(
//               child: const Text('Save'),
//               onPressed: () {
//                 final name = _nameController.text;
//                 final email = _emailController.text;

//                 if (name.isNotEmpty && email.isNotEmpty) {
//                   final newStudent = Student(
//                     id: '',
//                     name: name,
//                     email: email,
//                   );

//                   studentViewModel.addStudent(newStudent);
//                   Navigator.pop(context);
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
