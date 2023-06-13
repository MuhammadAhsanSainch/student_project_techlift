import 'package:flutter/material.dart';

class StudentsDetailScreen extends StatefulWidget {
  final String image, name, email, phone, batchYear;
  const StudentsDetailScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.email,
      required this.phone,
      required this.batchYear});

  @override
  State<StudentsDetailScreen> createState() => _StudentsDetailScreenState();
}

class _StudentsDetailScreenState extends State<StudentsDetailScreen> {
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
                          ReusableRow(title: 'Name', value: widget.name),
                          ReusableRow(title: 'Email', value: widget.email),
                          ReusableRow(title: 'Mobile', value: widget.phone),
                          ReusableRow(
                              title: 'BatchYear', value: widget.batchYear)
                        ],
                      ),
                    )),
                CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage(widget.image),
                )
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [ReusableRow(title: "Course", value: widget.name)],
                ),
              ),
            )
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
