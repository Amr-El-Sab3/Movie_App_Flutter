
abstract class CastEvent {
  const CastEvent();
}

class FetchCast extends CastEvent {
  final String language;
  final int? movieId;

  FetchCast(this.language, this.movieId);
}