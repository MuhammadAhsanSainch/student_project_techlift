import 'package:combined_app/model/components/app_colors.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(
              Icons.language,
              color: AppColors.buttonColor,
            ),
            title: const Text('Change Language'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: AppColors.buttonColor,
            ),
            title: const Text('Update Profile'),
            onTap: () {
              Navigator.pushNamed(context, '/userprofile');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: AppColors.buttonColor,
            ),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
          ),
        ],
      ),
    );
  }
}
