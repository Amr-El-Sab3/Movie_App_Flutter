import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/UI/components/carousel_slider_item.dart';
import 'package:movies_app/UI/components/movie_row.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/UI/screens/movie_detail_page.dart';
import 'package:movies_app/blocs/movie_bloc/movie_event.dart';
import 'package:movies_app/blocs/movie_bloc/movie_state.dart';
import 'package:movies_app/blocs/movie_bloc/movies_bloc.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

String selectedLanguage = 'en'; // Default language

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  void _changeLanguage(String? language) {
    setState(() {
      selectedLanguage = language!;
    });
    context.read<MovieBloc>().add(FetchMovies(selectedLanguage));
  }

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(FetchMovies(selectedLanguage));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie App',style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF222831)),),centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButton<String>(
              value:selectedLanguage ,
              icon: const Icon(Icons.language),
              items: const [
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'ar', child: Text('Arabic')),
                DropdownMenuItem(value: 'fr', child: Text('French')),
                // Add more languages as needed
              ],
              onChanged: _changeLanguage,
            ),
          ),
        ],
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          } else if (state is MovieLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Up Coming",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  child: ShapeOfView(
                    shape: ArcShape(
                      direction: ArcDirection.Outside,
                      height: 20,
                      position: ArcPosition.Bottom,
                    ),
                    child: CarouselSlider(

                      options: CarouselOptions(
                        aspectRatio: 2.0,
                        //enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,

                      ),
                      items: state.upcomingMovies
                          .map((item) => InkWell(
                          onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  MovieDetailPage(movieId: item.id,),
                            ),
                          );}, child: carouselSliderItem(item)))
                          .toList(),
                    ),
                  ),
                ),


                const SizedBox(
                  height: 20,
                ),


                Expanded(
                  child: ListView(
                    children: [
                      buildMovieRow('Popular Movies', state.popularMovies,
                          selectedLanguage),
                      const SizedBox(height: 16,),
                      buildMovieRow('Top Rated Movies', state.topRatedMovies,
                          selectedLanguage),
                      const SizedBox(height: 25,) ,
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
