import 'package:flutter/material.dart';
import 'package:netflix_app/screens/download_screen.dart';
import 'package:netflix_app/screens/home/presentation/screens/home_screen.dart';
import 'package:netflix_app/screens/home/presentation/widgets/bottom_nav.dart';
import 'package:netflix_app/screens/more_screen.dart';
import 'package:netflix_app/screens/search/search_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final pages = [
    HomeScreen(),
    SearchScreen(),
    MoreScreen(),
    DownloadScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return pages[index];
        },
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
