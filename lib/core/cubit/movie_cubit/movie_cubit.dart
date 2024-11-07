import 'package:bloc/bloc.dart';
import 'package:netflix_app/core/repos/movies_repo.dart';
import 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  final MoviesRepo movieRepository;

  MovieCubit(this.movieRepository) : super(MovieInitial());

  void fetchTrendingMovies() async {
    try {
      emit(MovieLoading());
      final movies = await movieRepository.fetchTrendingMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError('Failed to load trending movies: $error'));
    }
  }

  void fetchNowPlayingMovies() async {
    try {
      emit(MovieLoading());
      final movies = await movieRepository.fetchNowPlayingMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError('Failed to load trending movies: $error'));
    }
  }

  void fetchUpComingMovies() async {
    try {
      emit(MovieLoading());
      final movies = await movieRepository.fetchUpcomingMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError('Failed to load upcoming movies: $error'));
    }
  }

  void fetchPopularMovies() async {
    try {
      emit(MovieLoading());
      final movies = await movieRepository.fetchPopularMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError('Failed to load popular movies: $error'));
    }
  }

  void fetchTopRatedMovies() async {
    try {
      emit(MovieLoading());
      final movies = await movieRepository.fetchTopRatedMovies();
      emit(MovieLoaded(movies));
    } catch (error) {
      emit(MovieError('Failed to load top-rated movies: $error'));
    }
  }
}
