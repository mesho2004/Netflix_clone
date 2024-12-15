import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:netflix_app/core/models/movie%20model/movie_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TMDBService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.themoviedb.org/3';
  final String _apiKey = '1fe2d8f35096ba9efd648c7d05ccf80d';
    static const String _watchlistKey = 'watchlist';


  // Authentication Methods
  Future<String> _createRequestToken() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/authentication/token/new',
        queryParameters: {'api_key': _apiKey},
      );
      return response.data['request_token'];
    } catch (e) {
      throw Exception('Failed to create request token');
    }
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final requestToken = await _createRequestToken();

      await _dio.post(
        '$_baseUrl/authentication/token/validate_with_login',
        queryParameters: {'api_key': _apiKey},
        data: {
          'username': username,
          'password': password,
          'request_token': requestToken,
        },
      );

      final sessionResponse = await _dio.post(
        '$_baseUrl/authentication/session/new',
        queryParameters: {'api_key': _apiKey},
        data: {'request_token': requestToken},
      );

      final sessionId = sessionResponse.data['session_id'];
      
      // Save session ID and username
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('session_id', sessionId);
      await prefs.setString('username', username);

      // Get account details
      final accountResponse = await _dio.get(
        '$_baseUrl/account',
        queryParameters: {
          'api_key': _apiKey,
          'session_id': sessionId,
        },
      );

      await prefs.setInt('account_id', accountResponse.data['id']);

      return {
        'success': true,
        'session_id': sessionId,
        'account_id': accountResponse.data['id'],
      };
    } catch (e) {
      throw Exception('Login failed: ${e.toString()}');
    }
  }

  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final sessionId = prefs.getString('session_id');

      if (sessionId != null) {
        await _dio.delete(
          '$_baseUrl/authentication/session',
          queryParameters: {'api_key': _apiKey},
          data: {'session_id': sessionId},
        );
      }

      await prefs.clear();
    } catch (e) {
      throw Exception('Logout failed: ${e.toString()}');
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('session_id');
  }

  // Movie and TV Show Methods
  Future<List<Movie>> getUpcomingMovies() async {
    try {
      final response = await _dio.get(
        '$_baseUrl/movie/upcoming',
        queryParameters: {
          'api_key': _apiKey,
          'language': 'en-US',
          'page': 1,
        },
      );

      if (response.statusCode == 200) {
        final results = response.data['results'] as List;
        return results.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to load upcoming movies',
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Invalid API key. Please check your TMDB API key');
      } else if (e.type == DioExceptionType.connectionTimeout) {
        throw Exception('Connection timeout. Please check your internet connection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Unable to receive data. Please try again');
      } else {
        throw Exception('Failed to load upcoming movies: ${e.message}');
      }
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/movie/$movieId',
        queryParameters: {
          'api_key': _apiKey,
          'append_to_response': 'videos,credits',
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load movie details');
    }
  }

  Future<Map<String, dynamic>> getTVShowDetails(int tvId) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/tv/$tvId',
        queryParameters: {
          'api_key': _apiKey,
          'append_to_response': 'videos,credits',
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load TV show details');
    }
  }

  Future<Map<String, dynamic>> getSeasonDetails(int tvId, int seasonNumber) async {
    try {
      final response = await _dio.get(
        '$_baseUrl/tv/$tvId/season/$seasonNumber',
        queryParameters: {
          'api_key': _apiKey,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('Failed to load season details');
    }
  }

  // Watchlist Methods
 Future<void> addToList(int mediaId, String mediaType) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final watchlistString = prefs.getString(_watchlistKey);
      final List<Map<String, dynamic>> watchlist = watchlistString != null
          ? List<Map<String, dynamic>>.from(json.decode(watchlistString))
          : [];

      // Check if the item is already in the watchlist
      final existingItemIndex = watchlist.indexWhere(
        (item) => item['mediaId'] == mediaId && item['mediaType'] == mediaType,
      );

      if (existingItemIndex == -1) {
        // Add the new item to the watchlist
        watchlist.add({
          'mediaId': mediaId,
          'mediaType': mediaType,
          'dateAdded': DateTime.now().toIso8601String(),
        });
        await prefs.setString(_watchlistKey, json.encode(watchlist));
      }
    } catch (e) {
      throw Exception('Failed to add to watchlist: $e');
    }
  }

Future<void> removeFromList(int mediaId, String mediaType) async {
  try {
    final prefs = await SharedPreferences.getInstance();
    final watchlistString = prefs.getString(_watchlistKey);
    final watchlist = watchlistString != null
        ? List<Map<String, dynamic>>.from(json.decode(watchlistString))
        : [];

    // Remove the item from the watchlist
    watchlist.removeWhere(
      (item) => item['mediaId'] == mediaId && item['mediaType'] == mediaType,
    );

    await prefs.setString(_watchlistKey, json.encode(watchlist));
  } catch (e) {
    throw Exception('Failed to remove from watchlist');
  }
}

Future<List<Map<String, dynamic>>> getMyList() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final watchlistString = prefs.getString(_watchlistKey);
      if (watchlistString == null) {
        return [];
      }

      final List<Map<String, dynamic>> watchlist = List<Map<String, dynamic>>.from(
        json.decode(watchlistString),
      );

      // Fetch detailed information for each item in the watchlist
      final List<Map<String, dynamic>> detailedList = [];
      
      for (var item in watchlist) {
        try {
          final int mediaId = item['mediaId'];
          final String mediaType = item['mediaType'];
          
          final response = await _dio.get(
            '$_baseUrl/$mediaType/$mediaId',
            queryParameters: {
              'api_key': _apiKey,
            },
          );

          if (response.statusCode == 200) {
            final details = response.data;
            details['media_type'] = mediaType; // Add media_type to the response
            detailedList.add(details);
          }
        } catch (e) {
          print('Error fetching details for item: ${item['mediaId']} - $e');
          continue;
        }
      }

      return detailedList;
    } catch (e) {
      throw Exception('Failed to load watchlist: $e');
    }
  }


  Future<bool> isInWatchlist(int mediaId, String mediaType) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final watchlistString = prefs.getString(_watchlistKey);
      final watchlist = watchlistString != null
          ? List<Map<String, dynamic>>.from(json.decode(watchlistString))
          : [];

      return watchlist.any(
        (item) => item['mediaId'] == mediaId && item['mediaType'] == mediaType,
      );
    } catch (e) {
      return false;
    }
  }
}