
abstract class DetailsEvent {
  const DetailsEvent();
}

class FetchDetails extends DetailsEvent {
  final String language;
  final int? movieId;

  FetchDetails(this.language, this.movieId);
}