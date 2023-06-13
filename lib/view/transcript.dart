import 'package:flutter/material.dart';

class Transcript extends StatelessWidget {
  final _aiController = TextEditingController();
  final _madController = TextEditingController();
  final _databaseController = TextEditingController();
  final _cyberSecurityController = TextEditingController();
  final _dipController = TextEditingController();
  final _msController = TextEditingController();
  final _vsController = TextEditingController();
  final _swController = TextEditingController();

  final _avgGradeController = TextEditingController();

  final _firstSemesterController = TextEditingController();
  final _secondSemesterController = TextEditingController();

  Transcript({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: const Text('Grade Calculator'),
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('First Semester'),
                      MyRow(
                          title: 'Digital Image Processing:',
                          controller: _dipController),
                      MyRow(
                          title: 'Virtual Systems:', controller: _vsController),
                      MyRow(
                          title: 'Modeling & Simulation:',
                          controller: _msController),
                      MyRow(
                          title: 'Database Systems:',
                          controller: _databaseController),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (_dipController.text.trim().isEmpty ||
                      _vsController.text.trim().isEmpty ||
                      _msController.text.trim().isEmpty ||
                      _databaseController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Please enter the marks of relevant subjects!')));
                  } else {
                    _calculateGradeForFirstSemester;
                  }
                },
                child: const Text('Calculate GPA')),
            MyRow(
              title: 'First Semester GPA',
              controller: _firstSemesterController,
              isReadOnly: true,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text('Second Semester'),
                      MyRow(
                          title: 'Mobile App Development:',
                          controller: _madController),
                      MyRow(
                          title: 'Artifical Intelligence:',
                          controller: _aiController),
                      MyRow(
                          title: 'Cyber Security:',
                          controller: _cyberSecurityController),
                      MyRow(
                          title: 'Software Engineering:',
                          controller: _swController),
                    ],
                  ),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  if (_madController.text.trim().isEmpty ||
                      _aiController.text.trim().isEmpty ||
                      _swController.text.trim().isEmpty ||
                      _cyberSecurityController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            'Please enter the marks of relevant subjects!')));
                  } else {
                    _calculateGradeForSecondSemester;
                  }
                },
                child: const Text('Calculate GPA')),
            MyRow(
              title: 'Second Semester GPA',
              controller: _secondSemesterController,
              isReadOnly: true,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.calculate),
              onPressed: () {
                if (_firstSemesterController.text.trim().isEmpty ||
                    _secondSemesterController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please Calculate GPA First!'),
                  ));
                }
              },
              label: const Text('Calculate CGPA'),
            ),
            MyRow(title: 'CGPA', controller: _avgGradeController),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _calculateGradeForSecondSemester() {
    var s1 = double.parse(_aiController.text);
    var s2 = double.parse(_cyberSecurityController.text);
    var s3 = double.parse(_swController.text);
    var s4 = double.parse(_madController.text);
    _secondSemesterController.text =
        (((s1 + s2 + s3 + s4) / 400) * 100).toStringAsFixed(2).toString();
  }

  void _calculateGradeForFirstSemester() {
    var s1 = double.parse(_dipController.text);
    var s2 = double.parse(_msController.text);
    var s3 = double.parse(_vsController.text);
    var s4 = double.parse(_databaseController.text);
    _firstSemesterController.text =
        (((s1 + s2 + s3 + s4) / 400) * 100).toStringAsFixed(2).toString();
  }

  void _calculateAvgGrade() {
    var avg = double.parse(_firstSemesterController.text) +
        double.parse(_secondSemesterController.text);
    _avgGradeController.text = (avg / 2).toStringAsFixed(2).toString();
  }
}

class MyRow extends StatelessWidget {
  const MyRow({
    super.key,
    required this.title,
    required this.controller,
    this.isReadOnly = false,
  });
  final String title;
  final TextEditingController controller;
  final bool isReadOnly;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Expanded(child: Text(title)),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: isReadOnly == true
                ? const InputDecoration(
                    hintText: 'GPA',
                  )
                : const InputDecoration(hintText: 'Obtained Marks'),
            readOnly: isReadOnly,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
