import 'package:combined_app/model/components/app_colors.dart';
import 'package:combined_app/view/settings.dart';
import 'package:combined_app/view/transcript.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const DashBoard(),
    Transcript(),
    const Settings(),
  ];

  void _onTapped(int a) {
    setState(() {
      _selectedIndex = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.buttonColor,
        title: const Text(
          'Welcome to TechLift',
          style: TextStyle(
              color: AppColors.buttonTextColor, fontWeight: FontWeight.w400),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          //disable the back button behavior
          return false;
        },
        child: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Transcript'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black,
        onTap: _onTapped,
      ),
    );
  }
}
