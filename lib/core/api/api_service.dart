import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_app/core/constant/apikey.dart';
import 'package:netflix_app/core/models/movie_details_model.dart';
import 'package:netflix_app/core/models/movie_model.dart';


class Api {
  final Dio _dio = Dio();

  static const trending = '${baseUrl}trending/movie/week$key';
  static const upcoming = '${baseUrl}movie/upcoming$key';
  static const nowPlaying = '${baseUrl}movie/now_playing$key';
  static const topRated = '${baseUrl}tv/top_rated$key';
  static const popular = '${baseUrl}tv/popular$key';

  

  Future<List<Movie>> getTrendingMovies() async {
    try {
      final response = await _dio.get(trending);
      final decodeData = response.data['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      log('Error fetching trending movies: $e');
      throw Exception('Failed to load trending movies');
    }
  }

  Future<List<Movie>> getUpcomingMovie() async {
    try {
      final response = await _dio.get(upcoming);
      final decodeData = response.data['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      log('Error fetching upcoming movies: $e');
      throw Exception('Failed to load upcoming movies');
    }
  }

  Future<List<Movie>> getNowPlaying() async {
    try {
      final response = await _dio.get(nowPlaying);
      final decodeData = response.data['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      log('Error fetching now playing movies: $e');
      throw Exception('Failed to load now playing movies');
    }
  }

  Future<List<Movie>> getTopRated() async {
    try {
      final response = await _dio.get(topRated);
      final decodeData = response.data['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      log('Error fetching top-rated movies: $e');
      throw Exception('Failed to load top-rated movies');
    }
  }

  Future<List<Movie>> getPopular() async {
    try {
      final response = await _dio.get(popular);
      final decodeData = response.data['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      log('Error fetching popular movies: $e');
      throw Exception('Failed to load popular movies');
    }
  }

  Future<List<Movie>> getSearch(String searchText) async {
    final search = '${baseUrl}search/movie?query=$searchText$key';
    try {
      final response = await _dio.get(search);
      final decodeData = response.data['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      log('Error searching for movies: $e');
      throw Exception('Failed to search movies');
    }
  }

  Future<MovieDetailModel> getDetails(int id) async {
    final details = '${baseUrl}movie/$id$key';
    try {
      final response = await _dio.get(details);
      return MovieDetailModel.fromJson(response.data);
    } catch (e) {
      log('Error fetching movie details: $e');
      throw Exception('Failed to load movie details');
    }
  }

  Future<List<Movie>> getRecommendation(int id) async {
    final recommendation = '${baseUrl}movie/$id/recommendations$key';
    try {
      final response = await _dio.get(recommendation);
      final decodeData = response.data['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } catch (e) {
      log('Error fetching movie recommendations: $e');
      throw Exception('Failed to load recommendations');
    }
  }
}
