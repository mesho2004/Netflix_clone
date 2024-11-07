import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/core/api/api_service.dart';
import 'package:netflix_app/core/cubit/movie_cubit/movie_cubit.dart';
import 'package:netflix_app/core/cubit/movie_cubit/movie_state.dart';
import 'package:netflix_app/core/repos/movies_repo.dart';
import 'package:netflix_app/screens/details/details_screen.dart';

class CustomMovie extends StatelessWidget {
  const CustomMovie({required this.title, required this.movieType});
  final String title;
  final String movieType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = MovieCubit(MoviesRepo(Api()));

        switch (movieType) {
          case 'popular':
            cubit.fetchPopularMovies();
            break;
          case 'top':
            cubit.fetchTopRatedMovies();
            break;
          case 'upcoming':
            cubit.fetchUpComingMovies();
            break;
          case 'now_playing':
            cubit.fetchNowPlayingMovies();
            break;
          case 'trending':
          default:
            cubit.fetchTrendingMovies();
        }

        return cubit;
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 180,
            child: BlocBuilder<MovieCubit, MovieState>(
              builder: (context, state) {
                if (state is MovieLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is MovieLoaded) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MovieDetail(id: movie.id)));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              movie.fullImageUrl,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is MovieError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Center(child: Text('No movies found.'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
