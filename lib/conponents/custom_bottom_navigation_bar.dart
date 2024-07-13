import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true, // 選択されたアイテムのラベルを常に表示
      showUnselectedLabels: true, // 選択されていないアイテムのラベルを常に表示
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.green,
      selectedLabelStyle: const TextStyle(color: Colors.redAccent),
      unselectedLabelStyle: const TextStyle(color: Colors.redAccent),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.school, size: 24),
          label: '学校',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit, size: 24),
          label: 'クラス',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups, size: 24),
          label: 'チーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, size: 24),
          label: 'プロフィール',
        ),
      ],
    );
  }
}
