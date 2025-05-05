
abstract class MovieEvent {
  const MovieEvent();
}

class FetchMovies extends MovieEvent {
  final String language;

  FetchMovies(this.language);
}