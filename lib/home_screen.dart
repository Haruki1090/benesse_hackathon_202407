import 'package:benesse_hackathon_202407/conponents/custom_bottom_navigation_bar.dart';
import 'package:benesse_hackathon_202407/login_screen.dart';
import 'package:benesse_hackathon_202407/screens/class_screen.dart';
import 'package:benesse_hackathon_202407/screens/profile_screen.dart';
import 'package:benesse_hackathon_202407/screens/school_screen.dart';
import 'package:benesse_hackathon_202407/screens/team_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  auth.User? user;
  Map<String, dynamic>? userData;
  int _selectedIndex = 0; // 現在の選択中のタブインデックス

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
    List<Widget> screens = [
      SchoolScreen(userData: userData), // 学校画面
      ClassScreen(userData: userData), // クラス画面
      TeamScreen(userData: userData), // チーム画面
      ProfileScreen(userData: userData), // プロフィール画面
    ];

    return Scaffold(
      body: Center(
        child: userData == null
            ? const CircularProgressIndicator()
            : screens[_selectedIndex],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
