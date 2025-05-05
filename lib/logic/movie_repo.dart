import 'package:movies_app/Models/movie_model.dart';
import 'package:movies_app/Models/cast_model.dart';
import 'package:movies_app/logic/api_service.dart';
import 'package:movies_app/Models/details_model.dart';

class MovieRepository {
  final MovieService movieService;

  MovieRepository(this.movieService);

  Future<MovieModel> fetchMovies(String searchBy, String lang) async {
    return await movieService.fetchMovies(searchBy, lang);
  }

  Future<DetailsModel> fetchDetails(int? id, String lang) async {
    return await movieService.fetchDetails(id, lang);
  }

  Future<CastModel> fetchCast(int? id, String lang) async {
    return await movieService.fetchCast(id, lang);
  }
}
