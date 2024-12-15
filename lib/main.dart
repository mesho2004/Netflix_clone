import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:netflix_app/screens/splash/splash_screen.dart';

final getIt = GetIt.instance;
void main() async {
WidgetsFlutterBinding.ensureInitialized();
 try{
  await Firebase.initializeApp();
}  catch(e){
  print("error $e");
}
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      
    );
  }
}
