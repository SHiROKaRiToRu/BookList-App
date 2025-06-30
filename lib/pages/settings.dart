import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          SettingsSegment(
            title: 'Home',
            onPressed: () {
              // Navigate to home settings page
            },
          ),
          SettingsSegment(
            title: 'Notification',
            onPressed: () {
              // Navigate to notification settings page
            },
          ),
          SettingsSegment(
            title: 'Appearance',
            onPressed: () {
              // Navigate to appearance settings page
            },
          ),
          SettingsSegment(
            title: 'Terms of Use',
            onPressed: () {
              // Navigate to terms of use page
            },
          ),
          SettingsSegment(
            title: 'Version',
            onPressed: () {
              // Navigate to version info page
            },
          ),
        ],
      ),
    );
  }
}

class SettingsSegment extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const SettingsSegment({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextButton(
        onPressed: onPressed,
        child: ListTile(
          title: Text(title),
        ),
      ),
    );
  }
}
