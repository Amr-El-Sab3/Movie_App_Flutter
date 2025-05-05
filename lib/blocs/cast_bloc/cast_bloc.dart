import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/blocs/cast_bloc/cast_event.dart';
import 'package:movies_app/blocs/cast_bloc/cast_state.dart';
import 'package:movies_app/logic/movie_repo.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  final MovieRepository repository;

  CastBloc(this.repository) : super(CastInitial()) {
    on<FetchCast>((event, emit) async {
      emit(CastLoading());
      try {
        final getCast =
            (await repository.fetchCast(event.movieId, event.language));
        emit(CastLoaded(getCast));
      } catch (e) {
        emit(CastError("Failed to fetch Details: $e"));
      }
    });
  }
}
