
import 'package:movies_app/Models/movie_model.dart';

abstract class MovieState {
  const MovieState();
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> popularMovies;
  final List<Movie> topRatedMovies;
  final List<Movie> upcomingMovies;
  

  MovieLoaded(this.popularMovies, this.topRatedMovies, this.upcomingMovies);
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
