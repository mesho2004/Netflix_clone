import 'package:flutter/material.dart';
import 'package:netflix_app/screens/home/widgets/bottom_nav.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Image.asset('assets/logo.png', width: 30),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("TV Shows"),
            Text("Movies"),
            Text("My List"),
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/netflix.png',
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Previews",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: List.generate(5, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/netflix.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),

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
