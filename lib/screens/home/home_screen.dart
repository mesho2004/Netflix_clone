import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home/widgets/bottom_nav.dart';
import 'package:netflix_app/screens/home/widgets/custom_movie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset('assets/logo.png',),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(onPressed: (){}, child:Text("TV Shows",style: TextStyle(color: Colors.white,fontSize: 20),),),
            TextButton(onPressed: (){}, child:Text("Movies",style: TextStyle(color: Colors.white,fontSize: 20),),),
            TextButton(onPressed: (){}, child:Text("My list",style: TextStyle(color: Colors.white,fontSize: 20),),),
            
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/movie.jfif',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
              Positioned(
                bottom: 20,
                child: Column(
                  children: [
                    Text(
                      "#2 in Egypt Today",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Icon(Icons.add, color: Colors.white),
                            Text("My List", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.play_arrow),
                          label: Text("Play"),
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          children: [
                            Icon(Icons.info_outline, color: Colors.white),
                            Text("Info", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          CustomMovie(text: "test"),
          // Continue Watching section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Continue Watching for Emenalo",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          // Add widgets for "Continue Watching" items here (like a horizontal list of movie cards)

        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomNav(),
    );
  }
}
