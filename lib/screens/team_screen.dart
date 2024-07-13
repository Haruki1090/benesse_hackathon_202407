import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  final Map<String, dynamic>? userData;

  const TeamScreen({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: userData == null
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome, ${userData!['username']}'),
                Text('School: ${userData!['school']}'),
                Text('Club: ${userData!['club']}'),
                Text('Grade: ${userData!['grade']}'),
                Text('Education Level: ${userData!['educationLevel']}'),
              ],
            ),
    );
  }
}
