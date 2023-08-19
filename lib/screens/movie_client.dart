import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

final class MovieClient implements IMovieClient {
  MovieClient({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  static const _baseUrl = 'movies-api.nomadcoders.workers.dev';

  final http.Client _httpClient;

  @override
  Future<MovieDetail> getByMovieId(int id) async {
    var request = Uri.https(_baseUrl, 'movie', {'id': id.toString()});
    final response = await _httpClient.get(request);
    if (response.statusCode != 200) {
      throw Exception("GetByMovieId $id failed with ${response.statusCode}");
    }
    final json = jsonDecode(response.body) as Map;
    return MovieDetail.fromJson(json as Map<String, dynamic>);
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    return await _getMovies('popular');
  }

  @override
  Future<List<Movie>> getComingSoonMovies() async {
    return await _getMovies('coming-soon');
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    return await _getMovies('now-playing');
  }

  Future<List<Movie>> _getMovies(String name) async {
    var request = Uri.https(_baseUrl, name);
    final response = await _httpClient.get(request);
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    if (!json.containsKey('results')) throw Exception("$name results not exist");
    return Movie.getMoviesFromJson(json);
  }
}

abstract interface class IMovieClient {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getComingSoonMovies();
  Future<MovieDetail> getByMovieId(int id);
}

class MovieDetail {
  int id;
  String? title;
  String? backdropPath;
  String? homepage;
  String? imdbId;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? status;
  String? tagline;
  num? popularity;
  num? revenue;
  num? runtime;
  num? voteAverage;
  num? voteCount;

  MovieDetail({
    required this.id,
    this.backdropPath,
    this.homepage,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.voteAverage,
    this.voteCount,
  });
  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'id': int id,
          'title': final title,
          'backdrop_path': final backdropPath,
          'homepage': final homepage,
          'imdb_id': final imdbId,
          'original_language': final originalLanguage,
          'original_title': final originalTitle,
          'overview': final overview,
          'popularity': num popularity,
          'poster_path': final posterPath,
          'release_date': final releaseDate,
          'revenue': num revenue,
          'runtime': num runtime,
          'status': final status,
          'tagline': final tagline,
          'vote_average': num voteAverage,
          'vote_count': num voteCount,
        }) {
      return MovieDetail(
        backdropPath: backdropPath,
        homepage: homepage,
        id: id,
        imdbId: imdbId,
        originalLanguage: originalLanguage,
        originalTitle: originalTitle,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        revenue: revenue,
        runtime: runtime,
        status: status,
        tagline: tagline,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
    } else {
      print('Invalid movie detail format: $json');
      throw const FormatException('Invalid movie detail format');
    }
  }
  @override
  String toString() {
    return 'MovieDetail{id: $id, title: $title, backdropPath: $backdropPath, homepage: $homepage, imdbId: $imdbId, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, posterPath: $posterPath, releaseDate: $releaseDate, status: $status, tagline: $tagline, popularity: $popularity, revenue: $revenue, runtime: $runtime, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}

class Movie {
  int id;
  String? title;
  String? overview;
  String? posterPath;
  String? backdropPath;
  String? releaseDate;
  num? popularity;
  num? voteAverage;
  num? voteCount;

  Movie({
    required this.id,
    this.backdropPath,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.voteCount,
  });

  static List<Movie> getMoviesFromJson(final Map<String, dynamic> json) {
    if (json
        case {
          'results': List results,
        }) {
      return [for (final result in results) Movie.fromJson(result)];
    } else {
      print('Invalid movie format: $json');
      throw const FormatException('Invalid movies format');
    }
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'id': int id,
          'title': final title,
          'backdrop_path': final backdropPath,
          'poster_path': final posterPath,
          'overview': final overview,
          'release_date': final releaseDate,
          'popularity': num popularity,
          'vote_average': num voteAverage,
          'vote_count': num voteCount,
        }) {
      return Movie(
        backdropPath: backdropPath,
        id: id,
        overview: overview,
        popularity: popularity,
        posterPath: posterPath,
        releaseDate: releaseDate,
        title: title,
        voteAverage: voteAverage,
        voteCount: voteCount,
      );
    } else {
      print('Invalid movie format: $json');
      throw const FormatException('Invalid movie format');
    }
  }

  @override
  String toString() {
    return 'Movie{id: $id, title: $title, overview: $overview, posterPath: $posterPath, backdropPath: $backdropPath, releaseDate: $releaseDate, popularity: $popularity, voteAverage: $voteAverage, voteCount: $voteCount}';
  }
}
