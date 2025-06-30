import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://static.vecteezy.com/system/resources/previews/016/724/121/non_2x/pain-tendo-akatsuki-free-vector.jpg'),
          ),
          const SizedBox(height: 20),
          AccountSegment(
            title: 'Personal Details',
            icon: Icons.person,
            onPressed: () {
              // Navigate to personal details page
            },
          ),
          AccountSegment(
            title: 'Password and Security',
            icon: Icons.lock,
            onPressed: () {
              // Navigate to password and security page
            },
          ),
          AccountSegment(
            title: 'Edit Profile',
            icon: Icons.edit,
            onPressed: () {
              // Navigate to edit profile page
            },
          ),
          AccountSegment(
            title: 'Ad Preferences',
            icon: Icons.adb,
            onPressed: () {
              // Navigate to ad preferences page
            },
          ),
        ],
      ),
    );
  }
}

class AccountSegment extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  const AccountSegment({
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: TextButton(
        onPressed: onPressed,
        child: ListTile(
          leading: Icon(icon),
          title: Text(title),
        ),
      ),
    );
  }
}
