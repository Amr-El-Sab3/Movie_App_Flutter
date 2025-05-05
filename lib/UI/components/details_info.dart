import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movies_app/Models/details_model.dart';

Widget movieInfoStatus(DetailsModel data) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Row(
      children: [
        Flexible(
          flex: 1,
          child: Center(
            child: Column(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: RichText(
                    text: TextSpan(
                      text: '${data.voteAverage}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '/10',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 4.0,
                  ),
                  child: Text(
                    'Rating',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: Column(
              children: [
                const Icon(
                  Icons.attach_money,
                  color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    data.revenue! < 1
                        ? 'USD -'
                        : NumberFormat.compactCurrency(
                      locale: 'en',
                      decimalDigits: 0,
                      name: "USD ",
                    ).format(data.revenue),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 4.0,
                  ),
                  child: Text(
                    'Revenue',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Center(
            child: Column(
              children: [
                const Icon(
                  Icons.local_movies_outlined,
                  color: Colors.redAccent,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Text(
                    data.status!,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 4.0,
                  ),
                  child: Text(
                    'Status',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
