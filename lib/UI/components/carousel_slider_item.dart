
import 'package:flutter/material.dart';
import 'package:movies_app/Models/movie_model.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';

Widget carouselSliderItem( Movie movies) {

  return Container(
    color:  const Color(0xFF76ABAE),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Expanded(
            child: ShapeOfView(
                shape: ArcShape(
                    direction: ArcDirection.Outside,
                    height: 20,
                    position: ArcPosition.Right
                ),
                child:  Image.network(
                    'https://image.tmdb.org/t/p/w500${movies.posterPath}',
                    fit: BoxFit.fitWidth),
            ),
          ),
          const SizedBox(
            width: 50,
          ),

          Expanded(
            child: SizedBox(
              width: 150,
              child: Text(
                movies.title.toString(),
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                color: Color(0xFF222831)),
              ),
            ),
          )
        ]),
  );
}

