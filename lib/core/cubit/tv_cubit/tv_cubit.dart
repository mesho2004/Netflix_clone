import 'package:bloc/bloc.dart';
import 'package:netflix_app/core/cubit/tv_cubit/tv_state.dart';
import 'package:netflix_app/core/repos/movies_repo.dart';
import 'package:netflix_app/core/repos/tv_repo.dart';

class TvCubit extends Cubit<TvState> {
  final TvRepo tvRepo;

  TvCubit(this.tvRepo) : super(TvInitial());

  void fetchOnAirTv() async {
    try {
      emit(TvLoading());
      final tvs = await tvRepo.fetchOnAirTv();
      emit(TvLoaded(tvs));
    } catch (error) {
      emit(TvError('Failed to load on air tv: $error'));
    }
  }

  void fetchAiringNowTv() async {
    try {
      emit(TvLoading());
      final tvs = await tvRepo.fetchAirTodayTv();
      emit(TvLoaded(tvs));
    } catch (error) {
      emit(TvError('Failed to load air now tv: $error'));
    }
  }

  void fetchTopRatedTv() async {
    try {
      emit(TvLoading());
      final tvs = await tvRepo.fetchTopRatedTv();
      emit(TvLoaded(tvs));
    } catch (error) {
      emit(TvError('Failed to load top rated tv: $error'));
    }
  }

  void fetchPopularTv() async {
    try {
      emit(TvLoading());
      final tvs = await tvRepo.fetchPopularTv();
      emit(TvLoaded(tvs));
    } catch (error) {
      emit(TvError('Failed to load popular tv: $error'));
    }
  }

  
}
