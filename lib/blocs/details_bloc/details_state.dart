import 'package:movies_app/Models/details_model.dart';

abstract class DetailsState {
  const DetailsState();
}

class DetailsInitial extends DetailsState {}

class DetailsLoading extends DetailsState {}

class DetailsLoaded extends DetailsState {
  final DetailsModel movieDetails;

  DetailsLoaded(this.movieDetails);
}

class DetailsError extends DetailsState {
  final String message;

  DetailsError(this.message);
}
