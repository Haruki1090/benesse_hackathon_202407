import 'package:benesse_hackathon_202407/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ClassScreen extends StatefulWidget {
  final Map<String, dynamic>? userData;

  const ClassScreen({Key? key, this.userData}) : super(key: key);

  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _contentController = TextEditingController();

  String _selectedClass = '1年A組';
  String _selectedSubject = '数学I';
  DateTime _selectedDeadline = DateTime.now();

  Future<void> _postHomework() async {
    if (_formKey.currentState!.validate()) {
      await _firestore.collection('homeworks').add({
        'class': _selectedClass,
        'subject': _selectedSubject,
        'deadline': _selectedDeadline,
        'content': _contentController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('宿題を投稿しました！'),
          backgroundColor: Colors.green,
        ),
      );

      _contentController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton<String>(
          value: _selectedClass,
          onChanged: (String? newValue) {
            setState(() {
              _selectedClass = newValue!;
            });
          },
          items: ['1年A組', '1年B組', '2年A組', '2年B組'].map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('homeworks')
            .where('class', isEqualTo: _selectedClass)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final homeworks = snapshot.data!.docs;

          return ListView.builder(
            itemCount: homeworks.length,
            itemBuilder: (context, index) {
              final homework = homeworks[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text('${homework['class']} - ${homework['subject']}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          '締切: ${homework['deadline'].toDate().toLocal().toString().split(' ')[0]}'),
                      Text('${homework['content']}'),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('宿題を投稿する'),
              content: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedClass,
                        decoration: const InputDecoration(labelText: 'クラス名'),
                        items: ['1年A組', '1年B組', '2年A組', '2年B組']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedClass = newValue!;
                          });
                        },
                      ),
                      DropdownButtonFormField<String>(
                        value: _selectedSubject,
                        decoration: const InputDecoration(labelText: '科目名'),
                        items: [
                          '数学I',
                          '数学A',
                          '数学Ⅱ',
                          '数学B',
                          '数学Ⅲ',
                          '数学C',
                          'C英語',
                          '英語表現',
                          '物理',
                          '化学',
                          '古文'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedSubject = newValue!;
                          });
                        },
                      ),
                      TextFormField(
                        controller: _contentController,
                        decoration: const InputDecoration(labelText: '内容'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '内容を入力してください';
                          }
                          return null;
                        },
                      ),
                      TextButton(
                        onPressed: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: _selectedDeadline,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );

                          if (pickedDate != null &&
                              pickedDate != _selectedDeadline) {
                            setState(() {
                              _selectedDeadline = pickedDate;
                            });
                          }
                        },
                        child: Text('締切日: ${_selectedDeadline.toLocal()}'
                            .split(' ')[0]),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _postHomework();
                    Navigator.of(context).pop();
                  },
                  child: const Text('投稿'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
