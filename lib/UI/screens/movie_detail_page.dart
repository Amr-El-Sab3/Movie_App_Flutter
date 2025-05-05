import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/components/details_description.dart';
import 'package:movies_app/UI/components/details_image.dart';
import 'package:movies_app/UI/components/details_info.dart';
import 'package:movies_app/UI/components/movie_cast.dart';
import 'package:movies_app/UI/screens/home_page.dart';
import 'package:movies_app/blocs/details_bloc/details_state.dart';
import 'package:movies_app/blocs/details_bloc/details_bloc.dart';
import 'package:movies_app/blocs/details_bloc/details_event.dart';
import 'package:movies_app/logic/api_service.dart';
import 'package:movies_app/logic/movie_repo.dart';

class MovieDetailPage extends StatefulWidget {
   const MovieDetailPage({super.key, required this.movieId});

  final int? movieId;


  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late  DetailsBloc detailsBloc = DetailsBloc(MovieRepository(MovieService()))..add(FetchDetails(selectedLanguage, widget.movieId?? 0));

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent,),
      body: SingleChildScrollView(
        child: BlocBuilder<DetailsBloc, DetailsState>(
          bloc: detailsBloc,
          builder: (context, state) {
            if (state is DetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DetailsError) {
              return Center(child: Text(state.message));
            } else if (state is DetailsLoaded) {
              return

                Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ShapeOfView(
                  //   shape: ArcShape(
                  //       direction: ArcDirection.Outside,
                  //       height: 20,
                  //       position: ArcPosition.Right
                  //   ),
                  //   child:  Container(
                  //     child: Image.network(
                  //         'https://image.tmdb.org/t/p/w500${state.movieDetails.posterPath}',
                  //         fit: BoxFit.fitWidth),
                  //   ),
                  // ),
                  DetailsImage(title: state.movieDetails.title!,avatar: state.movieDetails.posterPath!,),
                  const SizedBox(height: 20,),

                  movieDescInfo(state.movieDetails),
                  const SizedBox(height: 20,),

                  movieInfoStatus(state.movieDetails),
                  const SizedBox(height: 20,),

                  movieCast(state.movieDetails.id!),
                  const SizedBox(height: 20,),






                ],
              );
            }
            return Container();
          },
        ),
      ),);
  }
}
