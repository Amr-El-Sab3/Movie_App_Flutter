import 'package:movies_app/Models/cast_model.dart';

abstract class CastState {
  const CastState();
}

class CastInitial extends CastState {}

class CastLoading extends CastState {}

class CastLoaded extends CastState {
  final CastModel movieCasts;

  CastLoaded(this.movieCasts);
}

class CastError extends CastState {
  final String message;

  CastError(this.message);
}
