import 'package:animation_class/screens/movie_repository.dart';
import 'package:animation_class/screens/movie_screen.dart';
import 'package:flutter/material.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

typedef ButtonConstructor = Widget Function({
  required VoidCallback onPressed,
  required Widget child,
});

class _MoviesScreenState extends State<MoviesScreen> {
  late final MovieRespository movieRepository;
  late final Future<List<Movie>> popularMovies;
  late final Future<List<Movie>> nowPlayingMovies;
  late final Future<List<Movie>> comingSoonMovies;
  @override
  void initState() {
    super.initState();
    movieRepository = MovieRespository();
    popularMovies = movieRepository.getPopularMovies();
    nowPlayingMovies = movieRepository.getNowPlayingMovies();
    comingSoonMovies = movieRepository.getComingSoonMovies();
  }

  Future<MovieDetail> getMovieDetail(int id) async {
    return await movieRepository.getByMovieId(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoviesContainer(
                  future: popularMovies,
                  moviesType: Movies.popular,
                  movieRepository: movieRepository,
                ),
                const Divider(color: Colors.transparent),
                MoviesContainer(
                  future: nowPlayingMovies,
                  moviesType: Movies.nowPlaying,
                  movieRepository: movieRepository,
                ),
                const Divider(color: Colors.transparent),
                MoviesContainer(
                  future: comingSoonMovies,
                  moviesType: Movies.comingSoon,
                  movieRepository: movieRepository,
                ),
                const Divider(color: Colors.transparent),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.url,
    this.title,
    required this.id,
    required this.aspectRatio,
  });
  final String url;
  final String? title;
  final int id;
  final double width = 300;
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                  blurRadius: 3,
                  offset: const Offset(5, 5),
                ),
              ],
            ),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500/$url",
                fit: BoxFit.cover,
                width: width,
              ),
            ),
          ),
        ),
        if (title != null)
          SizedBox(
            height: 100,
            width: width,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
                left: 10,
              ),
              child: Text(
                title.toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                maxLines: 3,
                softWrap: true,
                textAlign: TextAlign.start,
              ),
            ),
          ),
      ],
    );
  }
}

enum Movies implements Comparable<Movies> {
  popular(
    title: "Popular Movies",
  ),
  nowPlaying(
    title: "Now Playing Movies",
  ),
  comingSoon(
    title: "Coming Soon Movies",
  );

  const Movies({
    required this.title,
  });
  final String title;
  @override
  int compareTo(Movies other) => index.compareTo(other.index);
}

extension MoviesExtension on Movies {
  MovieCard getCard(int id, String url, String title) => switch (this) {
        Movies.popular => MovieCard(
            key: ValueKey("popular_movie_$id"),
            url: url,
            id: id,
            aspectRatio: 5 / 3,
          ),
        Movies.nowPlaying => MovieCard(
            key: ValueKey("now_playing_$id"),
            url: url,
            title: title,
            id: id,
            aspectRatio: 1,
          ),
        Movies.comingSoon => MovieCard(
            key: ValueKey("coming_soon_$id"),
            url: url,
            id: id,
            aspectRatio: 3 / 5,
          ),
      };
}

class MoviesContainer extends StatelessWidget {
  const MoviesContainer({
    super.key,
    required this.future,
    required this.moviesType,
    required this.movieRepository,
  });
  final Future<List<Movie>> future;
  final Movies moviesType;
  final MovieRespository movieRepository;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          moviesType.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
        ),
        const Divider(color: Colors.transparent),
        FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SizedBox(
                height: 400,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieScreen(
                            future: movieRepository.getByMovieId(
                              snapshot.data![index].id,
                            ),
                          ),
                        ),
                      );
                    },
                    child: moviesType.getCard(
                      snapshot.data![index].id,
                      snapshot.data![index].posterPath.toString(),
                      snapshot.data![index].title.toString(),
                    ),
                  ),
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 24,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}

class Placeholder extends StatelessWidget {
  const Placeholder({
    super.key,
    required this.color,
    required this.title,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 100,
      height: 100,
      color: color,
      child: Text(title),
    );
  }
}

const ColorScheme movieTheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xff141414),
  onPrimary: Color(0xff141414),
  primaryContainer: Color(0xfffdf771),
  onPrimaryContainer: Color(0xff000000),
  secondary: Color(0xffece0ff),
  onSecondary: Color(0xff141414),
  secondaryContainer: Color(0xff956dc8),
  onSecondaryContainer: Color(0xff000000),
  tertiary: Color(0xffffdbe6),
  onTertiary: Color(0xff141414),
  tertiaryContainer: Color(0xffc6ed67),
  onTertiaryContainer: Color(0xff000000),
  error: Color(0xffffb4ab),
  onError: Color(0xff690005),
  errorContainer: Color(0xff93000a),
  onErrorContainer: Color(0xffffb4ab),
  background: Color(0xffeae1f8),
  onBackground: Color(0xff141414),
  surface: Color(0xffeae1f8),
  onSurface: Color(0xff141414),
  surfaceVariant: Color(0xff444346),
  onSurfaceVariant: Color(0xff000000),
  outline: Color(0xffa4337d),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xff141414),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffdfdfe),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff736f76),
  surfaceTint: Color(0xffeae1f8),
);
