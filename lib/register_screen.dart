import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _clubController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _educationLevel = '高校'; // 初期値を高校に設定

  // アカウント登録処理
  Future<void> _register() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'school': _schoolController.text,
          'club': _clubController.text,
          'grade': _gradeController.text,
          'username': _usernameController.text,
          'email': _emailController.text,
          'educationLevel': _educationLevel,
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      print('登録エラー: $e');
      // エラーメッセージの表示など
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('アカウント作成'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'メールアドレス'),
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'パスワード'),
                obscureText: true,
              ),
              TextField(
                controller: _schoolController,
                decoration: const InputDecoration(labelText: '学校名'),
              ),
              TextField(
                controller: _clubController,
                decoration: const InputDecoration(labelText: 'クラブ・部活動名'),
              ),
              TextField(
                controller: _gradeController,
                decoration: const InputDecoration(labelText: '学年'),
              ),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'ユーザー名'),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'highschool',
                    groupValue: _educationLevel,
                    onChanged: (value) {
                      setState(() {
                        _educationLevel = value!;
                      });
                    },
                  ),
                  const Text('高校生'),
                  Radio<String>(
                    value: 'juniorhighschool',
                    groupValue: _educationLevel,
                    onChanged: (value) {
                      setState(() {
                        _educationLevel = value!;
                      });
                    },
                  ),
                  const Text('中学生'),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _register,
                child: const Text('アカウントを作成'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
