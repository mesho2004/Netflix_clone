import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/api/api_service.dart';
import 'package:netflix_app/core/cubit/movie_cubit.dart';
import 'package:netflix_app/core/repos/movies_repo.dart';
import 'package:netflix_app/screens/home/presentation/widgets/bottom_nav.dart';
import 'package:netflix_app/screens/home/presentation/widgets/custom_movie.dart';

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
    return BlocProvider(
      create: (context) => MovieCubit(MoviesRepo(Api()))..fetchTrendingMovies(),
      child: Scaffold(
         appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Image.asset('assets/logo.png', width: 10),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: Text(
                  "TV Shows",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {},
              ),
              TextButton(
                child: Text(
                  "Movies",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {},
              ),
              TextButton(
                child: Text(
                  "My List",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/netflix.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 450,
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
                              TextButton(
                                child: Text("My List",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {},
                              )
                            ],
                          ),
                          SizedBox(width: 20),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.play_arrow),
                            label: Text("Play"),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                            ),
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Icon(Icons.info_outline, color: Colors.white),
                              TextButton(
                                child: Text("Info",
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {},
                              )
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
                "Continue Watching for Emenalo",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            SizedBox(height: 10),
            CustomMovie(title: "Popular on Netflix", movieType: 'popular'),
            SizedBox(height: 10),
            CustomMovie(title: "Top 10 in Egypt Today", movieType: 'top'),
            SizedBox(height: 10),
            CustomMovie(title: "Trending on Netflix", movieType: 'trending'),
            SizedBox(height: 10),
            CustomMovie(title: "Upcoming on Netflix", movieType: 'upcoming'),
            SizedBox(height: 10),
            CustomMovie(title: "Now Playing on Netflix", movieType: 'now_playing'),
          ],
        ),
      ),
    );
  }
}
