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
              title: Text(data.title.toString()),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Hero(
                  tag: tag,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500/${data.backdropPath}',
                    fit: BoxFit.cover,
                    height: double.infinity,
                    width: double.infinity,
                    alignment: Alignment.center,
                  ),
                ),
                Column(
                  children: [
                    const Divider(color: Colors.transparent),
                    Text(data.overview.toString()),
                    const Divider(color: Colors.transparent),
                    Text(data.imdbId.toString()),
                    const Divider(color: Colors.transparent),
                    Text(data.originalLanguage.toString()),
                    const Divider(color: Colors.transparent),
                  ],
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
