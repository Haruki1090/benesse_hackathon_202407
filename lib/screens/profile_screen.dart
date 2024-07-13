import 'package:benesse_hackathon_202407/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final Map<String, dynamic>? userData;

  ProfileScreen({super.key, this.userData});

  Future<void> _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プロフィール'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
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
      ),
    );
  }
}
