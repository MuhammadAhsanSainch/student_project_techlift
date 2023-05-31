// import 'package:combined_app/model/models/student.dart';
// import 'package:flutter/material.dart';

// class Students extends StatefulWidget {
//   const Students({super.key});

//   @override
//   State<Students> createState() => _StudentsState();
// }

// class _StudentsState extends State<Students> {
//   List<Student>? students;
//   final TextEditingController _searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Padding(
//             padding: const EdgeInsets.symmetric(vertical: 12),
//             child: TextField(
//               controller: _searchController,
//               onChanged: (value) {
//                 filterSearchResults(value);
//               },
//               decoration: const InputDecoration(
//                 labelText: "Search",
//                 hintText: "Search Students",
//                 prefixIcon: Icon(Icons.search),
//                 // border: OutlineInputBorder(
//                 //     borderRadius: BorderRadius.all(Radius.circular(20.0)))
//               ),
//             ),
//           ),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemBuilder: (BuildContext context, int index) {
//                   var studentItem = students![index];
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(
//                         context,
//                         '/students_profile',
//                         // arguments: 'Hello from HomePage',
//                       );
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Card(
//                         elevation: 5,
//                         color: Colors.white.withOpacity(1),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 200,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: <Widget>[
//                                     Text(studentItem.name.toString(),
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 18)),
//                                     Text(studentItem.email.toString(),
//                                         style: const TextStyle(
//                                             fontWeight: FontWeight.normal,
//                                             fontSize: 14)),
//                                     Text(
//                                       studentItem.mobile.toString(),
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           fontSize: 16),
//                                     ),
//                                     Text(
//                                       "${studentItem.password.toString()} ",
//                                       style: const TextStyle(
//                                           fontWeight: FontWeight.normal,
//                                           color: Colors.blue,
//                                           fontSize: 20),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: students == null ? 0 : students!.length,
//               ),
//             ),
//           ],
//         ));
//   }

//   @override
//   void initState() {
//     super.initState();
//     getStudents();
//   }

//   final duplicateItems = <Student>[];

//   void filterSearchResults(String query) {
//     List<Student> dummySearchList = <Student>[];
//     dummySearchList.addAll(duplicateItems);
//     if (query.isNotEmpty) {
//       List<Student> dummyListData = <Student>[];
//       for (var item in dummySearchList) {
//         if ((item.name!.toLowerCase().contains(query.toLowerCase()))) {
//           dummyListData.add(item);
//         }
//       }
//       setState(() {
//         students?.clear();
//         students?.addAll(dummyListData);
//       });
//       return;
//     } else {
//       setState(() {
//         students?.clear();
//         students?.addAll(duplicateItems);
//       });
//     }
//   }

//   Future<void> getStudents() async {
//     students = StudentsService.getStudents();
//     duplicateItems.addAll(students!);
//     setState(() {
//       // AppUtils.showflushBar("Students Fetched", context);
//     });
//   }
// }

// // class StudentsService {
// //   static getStudents() => [
// //         Student(
// //             id: 1,
// //             name: "Muhammad Ahsan",
// //             email: "ahsansainch@gmail.com",
// //             mobile: "03023880434",
// //             password: "ahsansainch"),
// //         Student(
// //             id: 1,
// //             name: "Mr. Raheel",
// //             email: "mr.rahil@outlook.com",
// //             mobile: "03102704036",
// //             password: "raheel321!@"),
// //         Student(
// //             id: 1,
// //             name: "Ahsan Malik",
// //             email: "aleesainch@gmail.com",
// //             mobile: "03423880437",
// //             password: "uzairalee"),
// //         Student(
// //             id: 1,
// //             name: "Unsa",
// //             email: "kmssainch@gmail.com",
// //             mobile: "03223880439",
// //             password: "kms321"),
// //         Student(
// //             id: 1,
// //             name: "Mahnoor",
// //             email: "unknowsainch@gmail.com",
// //             mobile: "03323880434",
// //             password: "!@kjfls")
// //       ];
// // }



// //     // FutureBuilder(
//           //     //     future: StudentsService.getStudents(),
//           //     //     builder: (context, snapshot) {
//           //     //       if (!snapshot.hasData) {
//           //     //         return
//           //     ListView.builder(itemBuilder: (context, index) {
//           //   var studentItem = students![index];
//           //   return Column(
//           //     children: [
//           //       Text('Student Name: ${studentItem.name}'),
//           //       Text('Student Email: ${studentItem.email}'),
//           //       Text('Student Phone: ${studentItem.mobile}'),
//           //     ],
//           //   );
//           // })
//           // //}
//           // // else{
//           // //   return ListView.builder(
//           // //     itemCount: snapshot.data,
//           // //     itemBuilder: itemBuilder)
//           // // }
//           // //}),