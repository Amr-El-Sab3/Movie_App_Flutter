import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  final String avatar;
  final String title;

  const DetailsImage({
    super.key,
    required this.avatar,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Stack(
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(
                Rect.fromLTRB(
                  0,
                  0,
                  rect.width,
                  rect.height,
                ),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Image.network(
              'https://image.tmdb.org/t/p/w500$avatar',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromRGBO(
                  0,
                  0,
                  0,
                  0.3,
                ),
                highlightColor: const Color.fromRGBO(
                  0,
                  0,
                  0,
                  0.1,
                ),
                onTap: () {},
              ),
            ),
          ),
          Positioned(
            bottom: 30.0,
            left: 10.0,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 28.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
