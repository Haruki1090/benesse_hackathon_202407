import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.green,
      selectedLabelStyle: const TextStyle(color: Colors.redAccent),
      unselectedLabelStyle: const TextStyle(color: Colors.redAccent),
      currentIndex: selectedIndex,
      onTap: onItemTapped,
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
