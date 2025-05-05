import 'package:flutter/material.dart';
import 'package:movies_app/Models/details_model.dart';
import 'package:shape_of_view_null_safe/shape_of_view_null_safe.dart';
import 'package:url_launcher/url_launcher.dart';
//https://www.youtube.com/watch?v=QZhGA36WSDM
Widget movieDescInfo(DetailsModel data) {

  Future<void>? _launched;
  final toLaunch = Uri.parse("https://www.youtube.com/watch?v=QZhGA36WSDM");
  

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // DES POSTER ==========================================================
        Expanded(
          flex: 1,
          child: ShapeOfView(
            shape: RoundRectShape(
                borderRadius: const BorderRadius.all(Radius.circular(10))),

            child: Image.network(
              "https://image.tmdb.org/t/p/w500${data.posterPath!}",
              height: 180.0,
              width: 120.0,
              fit: BoxFit.fill,
            ),
          ),
        ),



        // GENRES LIST ==========================================================
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.genres!.length,
                    itemBuilder: (context, index) {
                      Genres? genre = data.genres?[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white12,
                            ),
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6.0,
                              horizontal: 12,
                            ),
                            child: Text(
                              genre!.name!,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // OVERVIEW ==========================================================
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    data.overview!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                    style: const TextStyle(
                      height: 1.4,
                      color: Colors.white70,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),



                // WATCH TRAILER ==========================================================
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white12,
                      ),
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Watch Trailer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  onTap: () { _launchInBrowser(toLaunch);},
                ),




              ],
            ),
          ),
        ),
      ],
    ),
  );
}
