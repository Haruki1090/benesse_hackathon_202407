import 'package:flutter/material.dart';

class SchoolScreen extends StatelessWidget {
  const SchoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ベネッセ高校',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                '7月',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildEventItem('9', '期末テスト', Colors.white, Colors.black),
              _buildEventItem('10', '期末テスト', Colors.white, Colors.black),
              _buildEventItem('11', '期末テスト', Colors.white, Colors.black),
              _buildEventItem(
                  '28', '陸上競技部 地区記録会', Colors.green, Colors.white, true),
              const SizedBox(height: 40),
              const Text(
                'イベント',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              _buildEventDetailItem('部活動見学会があります！'),
              _buildEventDetailItem('吹奏楽部 定期演奏会開催について'),
              _buildEventDetailItem('【注意】夏季休業期間の自習室開講時間'),
              _buildEventDetailItem('大学オープンキャンパス日程まとめ'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventItem(
      String day, String event, Color bgColor, Color textColor,
      [bool isBold = false]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: bgColor,
            child: Text(
              day,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            event,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventDetailItem(String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          detail,
          style: const TextStyle(
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
