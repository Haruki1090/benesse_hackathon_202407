import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _clubController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String _educationLevel = '高校'; // 初期値を高校に設定
  String _selectedGrade = '1年';

  // アカウント登録処理
  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
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
            'grade': _selectedGrade,
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
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('エラー'),
              content: Text('登録に失敗しました: $e'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'メールアドレス'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'メールアドレスを入力してください。';
                    }
                    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                    if (!emailRegex.hasMatch(value)) {
                      return '有効なメールアドレスを入力してください。';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: 'パスワード'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'パスワードを入力してください。';
                    }
                    if (value.length < 6) {
                      return 'パスワードは6文字以上で入力してください。';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _schoolController,
                  decoration: const InputDecoration(labelText: '学校名'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '学校名を入力してください。';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _clubController,
                  decoration: const InputDecoration(labelText: 'クラブ・部活動名'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'クラブ・部活動名を入力してください。';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: _selectedGrade,
                  decoration: const InputDecoration(labelText: '学年'),
                  items: ['1年', '2年', '3年'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedGrade = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '学年を選択してください。';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'ユーザー名'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'ユーザー名を入力してください。';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<String>(
                      value: '高校',
                      groupValue: _educationLevel,
                      onChanged: (value) {
                        setState(() {
                          _educationLevel = value!;
                        });
                      },
                    ),
                    const Text('高校生'),
                    Radio<String>(
                      value: '中学',
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
      ),
    );
  }
}
