import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Models/cast_model.dart';
import 'package:movies_app/UI/screens/home_page.dart';
import 'package:movies_app/blocs/cast_bloc/cast_bloc.dart';
import 'package:movies_app/blocs/cast_bloc/cast_event.dart';
import 'package:movies_app/blocs/cast_bloc/cast_state.dart';
import 'package:movies_app/logic/api_service.dart';
import 'package:movies_app/logic/movie_repo.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

Widget movieCast(int movieId) {
  late CastBloc castBloc = CastBloc(MovieRepository(MovieService()))
    ..add(FetchCast(selectedLanguage, movieId));

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      const Text(
        "CAST",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      BlocBuilder<CastBloc, CastState>(
        bloc: castBloc,
        builder: (context, state) {
          if (state is CastLoading) {
            return const CircularProgressIndicator();
          } else if (state is CastLoaded) {
            int count = state.movieCasts.cast!.length > 15
                ? 15
                : state.movieCasts.cast!.length;
            return SizedBox(
              height: 250,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 12.0),
                scrollDirection: Axis.horizontal,
                itemCount: count,
                itemBuilder: (context, index) {
                  Cast data = state.movieCasts.cast![index];
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        ShapeOfView(
                          shape: CircleShape(
                              //borderRadius: BorderRadius.circular(12),
                              //borderColor: Colors.white, //optional
                              // borderWidth: 2, //optional
                              ),
                          child: Image.network(
                              'https://image.tmdb.org/t/p/w500${data.profilePath}',
                              fit: BoxFit.cover),
                        ),
                        Expanded(
                            child: Text(
                          data.name.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return Container();
          }
        },
      )
    ],
  );
}
