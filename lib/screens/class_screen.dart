import 'dart:math';

import 'package:benesse_hackathon_202407/login_screen.dart';
import 'package:benesse_hackathon_202407/models/homework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
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
  final Random _random = Random();

  String _selectedClass = '1年A組';
  String _selectedSubject = '数学I';
  DateTime _selectedDeadline = DateTime.now();

  Future<void> _postHomework() async {
    if (_formKey.currentState!.validate()) {
      final double randomProgress = _random.nextDouble(); // ランダムな数値を生成

      final homework = Homework(
        className: _selectedClass,
        subject: _selectedSubject,
        deadline: _selectedDeadline,
        content: _contentController.text,
        timestamp: Timestamp.now(),
        progress: randomProgress, // ランダムな進捗状況を設定
      );

      await _firestore.collection('homeworks').add(homework.toJson());

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
            .where('className', isEqualTo: _selectedClass)
            .orderBy('deadline', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('エラーが発生しました: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('データがありません'));
          }

          final homeworks = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Homework.fromJson(data);
          }).toList();

          return ListView.builder(
            itemCount: homeworks.length,
            itemBuilder: (context, index) {
              final homework = homeworks[index];
              return Card(
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${homework.className} - ${homework.subject}'),
                            Text(
                                '締切: ${homework.deadline.toLocal().toString().split(' ')[0]}'),
                            Text(homework.content),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 30, // 高さを半分に設定
                          child: PieChart(
                            PieChartData(
                              sections: [
                                PieChartSectionData(
                                  value: homework.progress * 100,
                                  color: Colors.green,
                                  title:
                                      '${(homework.progress * 100).toStringAsFixed(1)}%',
                                  radius: 18, // 半径を小さく設定
                                  titleStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                PieChartSectionData(
                                  value: (1 - homework.progress) * 100,
                                  color: Colors.white,
                                  title: '',
                                  radius: 18, // 半径を小さく設定
                                ),
                              ],
                              borderData: FlBorderData(show: false),
                              centerSpaceRadius: 20, // センタースペースを小さく設定
                              sectionsSpace: 0,
                            ),
                          ),
                        ),
                      ),
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
