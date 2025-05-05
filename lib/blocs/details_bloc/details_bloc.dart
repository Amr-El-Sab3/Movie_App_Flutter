

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/blocs/details_bloc/details_state.dart';
import 'package:movies_app/blocs/details_bloc/details_event.dart';
import 'package:movies_app/logic/movie_repo.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final MovieRepository repository;

  DetailsBloc(this.repository) : super(DetailsInitial()) {
    on<FetchDetails>((event, emit) async {
      emit(DetailsLoading());
      try {
        final movieDetails = (await repository.fetchDetails(event.movieId, event.language));
        emit(DetailsLoaded(movieDetails));

      } catch (e) {
        emit(DetailsError("Failed to fetch Details: $e"));
      }
    });
  }
}