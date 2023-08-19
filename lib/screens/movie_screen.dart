import 'package:animation_class/screens/movie_repository.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({
    super.key,
    required this.future,
    required this.tag,
  });
  final Future<MovieDetail> future;
  final String tag;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (constex, snapshot) {
        if (snapshot.hasData) {
          var data = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black,
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Hero(
                  tag: tag,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${data.posterPath ?? data.backdropPath}',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // alignment: Alignment.center,
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Positioned(
                    top: MediaQuery.of(context).size.height * 0.45,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.title.toString(),
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            // Text(data.getFavoriteRate().toString()),
                            Stars(rate: data.getFavoriteRate()),
                            const Divider(color: Colors.transparent),
                            Text(data.getRunTimeAndGenres()),
                            const Divider(color: Colors.transparent),
                            const Text(
                              "Storyline",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            const Divider(color: Colors.transparent),
                            Text(
                              data.overview.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class Stars extends StatelessWidget {
  const Stars({
    super.key,
    required this.rate,
  });
  final num rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < 5; i++)
          Icon(
            Icons.star,
            color: i < rate ? Colors.yellowAccent.shade700 : Colors.white,
            shadows: const [
              Shadow(
                color: Colors.black,
                blurRadius: 1,
              ),
            ],
          ),
      ],
    );
  }
}
