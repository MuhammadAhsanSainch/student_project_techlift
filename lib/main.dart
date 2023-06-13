import 'package:combined_app/services/api_service.dart';
import 'package:combined_app/view/courses_list.dart';
import 'package:combined_app/view/dashboard.dart';
import 'package:combined_app/view/home.dart';
import 'package:combined_app/view/leave_application.dart';
import 'package:combined_app/view/signin.dart';
import 'package:combined_app/view/signup.dart';
import 'package:combined_app/view/students_list.dart';
import 'package:combined_app/view/teachers_list.dart';
import 'package:combined_app/view/userprofile.dart';
import 'package:combined_app/view_model/student_view_model.dart';
import 'package:combined_app/view_model/userprofile_controller.dart';
// import 'package:combined_app/view/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => StudentViewModel(apiService: ApiService()),
        ),
        Provider(
          create: (context) => ProfileController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          '/signin': (context) => const Signin(),
          '/signup': (context) => const SignUp(),
          '/home': (context) => const Home(),
          '/dashboard': (context) => const DashBoard(),
          '/students': (context) => const StudentsListScreen(),
          '/teachers': (context) => const TeachersListScreen(),
          '/courses': (context) => const CoursesListScreen(),
          '/application': (context) => const LeaveApplicationScreen(),
          '/userprofile': (context) => const UserProfileScreen(),
        },
        initialRoute: '/home',
        home: const Home(),
      ),
    );
  }
}
