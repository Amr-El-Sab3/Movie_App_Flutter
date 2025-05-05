import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Models/cast_model.dart';
import 'package:movies_app/Models/details_model.dart';



class MovieService {
  final String apiKey = 'YOUR API KEY'; // API Key
  final String lang = "en-US"; // Default language (can be changed)
  final String searchBy = "popular";
  final String baseUrl = 'https://api.themoviedb.org/3/movie';

  // Fetch movies based on search type (e.g., popular, top_rated)
  Future<MovieModel> fetchMovies(String searchBy, String lang) async {
    final url = '$baseUrl/$searchBy?language=$lang&api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return MovieModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movies');
    }
  }

  // Fetch movie details based on movie ID
  Future<DetailsModel> fetchDetails(int? id, String lang) async {
    final url = '$baseUrl/$id?language=$lang&api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return DetailsModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }

  // Fetch movie cast based on movie ID
  Future<CastModel> fetchCast(int? id, String lang) async {
    final url = '$baseUrl/$id/credits?language=$lang&api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return CastModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie cast');
    }
  }

  // Request a new token
  Future<String> requestToken() async {
    final url = 'https://api.themoviedb.org/3/authentication/token/new?api_key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final requestToken = json.decode(response.body)['request_token'];
      return requestToken;
    } else {
      throw Exception('Failed to get request token');
    }
  }

  // Validate user login with username and password using the request token
  Future<bool> validateLogin(String username, String password) async {
    try {
      // Fetch request token before using it in login validation
    //TOdo  final requestToken = await requestToken();

      final loginUrl = 'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$apiKey';
      final loginResponse = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
          'request_token': requestToken,
        }),
      );

      if (loginResponse.statusCode == 200) {
        final success = json.decode(loginResponse.body)['success'];
        return success; // Return true if login was successful
      } else {
        throw Exception('Failed to validate login');
      }
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  // (Optional) Get a session ID after a successful login
  Future<String?> createSession(String username, String password) async {
    try {
      // Fetch request token before using it in login validation
    //TODO  final requestToken = await requestToken();

      final loginUrl = 'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=$apiKey';
      final loginResponse = await http.post(
        Uri.parse(loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'username': username,
          'password': password,
          'request_token': requestToken,
        }),
      );

      if (loginResponse.statusCode == 200) {
        final sessionId = json.decode(loginResponse.body)['session_id'];
        return sessionId; // Return session ID if login was successful
      } else {
        throw Exception('Failed to create session');
      }
    } catch (e) {
      throw Exception('Session creation failed: $e');
    }
  }
}
