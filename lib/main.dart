import 'package:combined_app/services/api_service.dart';
import 'package:combined_app/view/dashboard.dart';
import 'package:combined_app/view/home.dart';
import 'package:combined_app/view/signin.dart';
import 'package:combined_app/view/signup.dart';
import 'package:combined_app/view/students_list.dart';
import 'package:combined_app/view_model/student_view_model.dart';
// import 'package:combined_app/view/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StudentViewModel(apiService: ApiService()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          useMaterial3: true,
        ),
        routes: {
          '/signin': (context) => const Signin(),
          '/signup': (context) => const SignUp(),
          '/home': (context) => const Home(),
          '/dashboard': (context) => const DashBoard(),
          '/students': (context) => const StudentListScreen(),
          // '/students_profile': (context) => const StudentProfile()
        },
        initialRoute: '/home',
        home: const Home(),
      ),
    );
  }
}
