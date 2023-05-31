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
    return Column(
      children: [
        ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signin');
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.buttonColor,
              size: 24,
            ),
            label: const Text('Logout'))
      ],
    );
  }
}
