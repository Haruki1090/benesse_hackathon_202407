import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    user = _auth.currentUser;
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    if (user != null) {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(user!.uid).get();
      setState(() {
        userData = doc.data() as Map<String, dynamic>?;
      });
    }
  }

  Future<void> _logout() async {
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
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
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
