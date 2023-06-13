import 'package:combined_app/view/signin.dart';
import 'package:flutter/material.dart';

class TeachersDetailScreen extends StatefulWidget {
  final String image, name, email, phone, courseName;
  final int id, courseId, creditHours;
  const TeachersDetailScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.image,
      required this.email,
      required this.phone,
      required this.courseId,
      required this.courseName,
      required this.creditHours});

  @override
  State<TeachersDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeachersDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * .067),
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .06,
                          ),
                          ReusableRow(title: 'Id', value: widget.id.toString()),
                          ReusableRow(title: 'Name', value: widget.name),
                          ReusableRow(title: 'Email', value: widget.email),
                          ReusableRow(title: 'Mobile', value: widget.phone),
                          SizedBox(
                            height: context.height * .04,
                          ),
                          const Text(
                            'Courses List',
                            textAlign: TextAlign.center,
                          ),
                          DataTable(
                            columns: const [
                              DataColumn(label: Text('Id')),
                              DataColumn(label: Text('Name')),
                              DataColumn(label: Text('Credit Hours')),
                            ],
                            rows: [
                              DataRow(cells: [
                                DataCell(Text(widget.courseId.toString())),
                                DataCell(Text(widget.courseName)),
                                DataCell(Text(widget.creditHours.toString())),
                              ]),
                            ],
                          )
                        ],
                      ),
                    )),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(widget.image),
                )
              ],
            ),
          ],
        ));
  }
}

class ReusableRow extends StatelessWidget {
  final String title, value;
  const ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          )
        ],
      ),
    );
  }
}
