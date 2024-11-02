import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:netflix_app/screens/home/presentation/screens/home_screen.dart';
import 'package:netflix_app/screens/home/presentation/screens/list_screen.dart';
import 'package:netflix_app/screens/search/search_screen.dart';
=======
=======
import 'package:netflix_app/screens/download_screen.dart';
>>>>>>> 738c996b51daba154ca15d6087f678e162ea2d5e
import 'package:netflix_app/screens/home/home_screen.dart';
import 'package:netflix_app/screens/more_screen.dart';
import 'package:netflix_app/screens/search_screen.dart';
>>>>>>> b985825298a6d87cd721c212f97f17f84e7e1eb9

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>DownloadScreen() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Lottie.asset('assets/netflix.json'));
  }
}
