
import 'package:netflix_app/core/models/movie_model.dart';

abstract class MovieState {}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  MovieLoaded(this.movies);
}

class MovieError extends MovieState {
  final String errorMessage;

  MovieError(this.errorMessage);
}
