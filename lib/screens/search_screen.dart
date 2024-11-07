import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {"title": "Citation", "image": "assets/movie.jfif"},
    {"title": "Oloture", "image": "assets/movie.jfif"},
    {"title": "The Setup", "image": "assets/movie.jfif"},
    {"title": "Breaking Bad", "image": "assets/movie.jfif"},
    {"title": "Ozark", "image": "assets/movie.jfif"},
    {"title": "The Governor", "image": "assets/movie.jfif"},
    {"title": "Your Excellency", "image": "assets/movie.jfif"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for a show, movie, genre, e.t.c.',
                  prefixIcon: Icon(Icons.search, color: Colors.white),
                  suffixIcon: Icon(Icons.mic, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(color: Colors.white54),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Top Searches title
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Top Searches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Movie cards list
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return MovieCard(
                    title: movies[index]["title"]!,
                    imagePath: movies[index]["image"]!,
                  );
                },
                childCount: movies.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const MovieCard({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[800],
      elevation: 4,
      shape: RoundedRectangleBorder(
          // borderRadius: BorderRadius.circular(8.0),
          ),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image on the left
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),

            // Title in the center
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Play icon on the right
            Icon(
              Icons.play_circle_outline,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
