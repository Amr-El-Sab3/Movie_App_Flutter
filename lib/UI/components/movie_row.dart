import 'package:flutter/material.dart';
import 'package:movies_app/UI/screens/movie_detail_page.dart';
import 'package:movies_app/Models/movie_model.dart';

Widget buildMovieRow(String title, List<Movie> movies, String language) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      SizedBox(
        height: 220,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];

            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(
                      movieId: movies[index].id!,
                    ),
                  ),
                );
              },
              child: Container(
                width: 120,
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Hero(
                          tag: movie.title.toString(),
                          child: Image.network(
                              'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                              fit: BoxFit.cover)),
                    ),
                    Expanded(
                        child: Text(
                      movie.title.toString(),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
