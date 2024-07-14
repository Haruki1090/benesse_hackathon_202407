import 'package:flutter/material.dart';

class TeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '野球部',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '東高校 練習試合',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    '3日後',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'メンバーの学習進捗',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildMemberProgress(
                      'hello1010', '数学I', '7月20日', Colors.black, 5),
                  _buildMemberProgress(
                      'saitama20', '古典', '7月21日', Colors.red, 3),
                  _buildMemberProgress(
                      'tokyo10', '数学A', '7月22日', Colors.green, 7),
                  _buildMemberProgress(
                      'tokyo10', '古典', '7月23日', Colors.green, 2),
                  _buildMemberProgress(
                      'tokyo10', '野球ノート', '7月24日', Colors.green, 8),
                  _buildMemberProgress('good06', '英語', '7月25日', Colors.blue, 4),
                  _buildMemberProgress(
                      'hello1010', '物理', '7月26日', Colors.black, 1),
                  _buildMemberProgress(
                      'saitama20', '化学', '7月27日', Colors.red, 6),
                  _buildMemberProgress(
                      'tokyo10', '数学B', '7月28日', Colors.green, 9),
                  _buildMemberProgress(
                      'tokyo10', '歴史', '7月29日', Colors.green, 10),
                  _buildMemberProgress(
                      'tokyo10', '地理', '7月30日', Colors.green, 12),
                  _buildMemberProgress(
                      'good06', '政治経済', '7月31日', Colors.blue, 11),
                  _buildMemberProgress(
                      'hello1010', '生物', '8月1日', Colors.black, 14),
                  _buildMemberProgress(
                      'saitama20', '家庭科', '8月2日', Colors.red, 13),
                  _buildMemberProgress(
                      'tokyo10', '美術', '8月3日', Colors.green, 15),
                  _buildMemberProgress(
                      'tokyo10', '音楽', '8月4日', Colors.green, 16),
                  _buildMemberProgress(
                      'tokyo10', '体育', '8月5日', Colors.green, 17),
                  _buildMemberProgress('good06', '保健', '8月6日', Colors.blue, 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMemberProgress(
      String username, String subject, String dueDate, Color color, int likes) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 20,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(subject, style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(dueDate, style: TextStyle(fontSize: 14)),
              Text('提出',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Icon(Icons.favorite, color: Colors.red),
              Text('$likes', style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
