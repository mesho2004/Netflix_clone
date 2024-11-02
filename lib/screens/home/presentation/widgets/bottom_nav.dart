import 'package:flutter/material.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int value, _) {
          return BottomNavigationBar(
              currentIndex: value,
              onTap: (index) {
                indexChangeNotifier.value = index;
              },
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedIconTheme: IconThemeData(color: Colors.white),
              unselectedIconTheme: IconThemeData(color: Colors.grey),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.video_library_outlined),
                    label: 'Coming Soon'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.download), label: 'Downloads'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.stacked_bar_chart), label: 'More'),
              ]);
        });
  }
}
