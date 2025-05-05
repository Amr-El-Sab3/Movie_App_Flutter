import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/blocs/movie_bloc/movie_event.dart';
import 'package:movies_app/blocs/movie_bloc/movie_state.dart';
import 'package:movies_app/logic/movie_repo.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository repository;

  MovieBloc(this.repository) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final popularMovies =
            (await repository.fetchMovies('popular', event.language)).results!;
        final topRatedMovies =
            (await repository.fetchMovies('top_rated', event.language))
                .results!;
        final upcomingMovies =
            (await repository.fetchMovies('upcoming', event.language)).results!;
        emit(MovieLoaded(popularMovies, topRatedMovies, upcomingMovies));
      } catch (e) {
        emit(MovieError("Failed to fetch movies: $e"));
      }
    });
  }
}
