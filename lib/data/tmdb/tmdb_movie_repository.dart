import "package:dio/dio.dart";

import "../../domain/entities/actor.dart";
import "../../domain/entities/movie.dart";
import "../../domain/entities/movie_detail.dart";
import "../../domain/entities/result.dart";
import "../repositories/movie_repository.dart";

class TmdbMovieRepository implements MovieRepository {
  TmdbMovieRepository({Dio? dio}) : _dio = dio ?? Dio();

  final Dio? _dio;
  final String _accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjMxZTc1NzMzNmJhN2U2OTFhYzIxNzdhYzFkZDA0NiIsIm5iZiI6MTYxMTQ4NDY1NS41ODcwMDAxLCJzdWIiOiI2MDBkNGRlZjAwNmVlZTAwM2I4MWM2OTEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.MgqmH_ogJSv9Rf9jq7bpdBwE5f4LpLfoJIyr66-SBv8";
  late final Options _options = Options(
    headers: {
      "Authorization": "Bearer $_accessToken",
      "accept": "application/json",
    },
  );

  @override
  Future<Result<List<Actor>>> getActorList({required int id}) async {
    try {
      final response = await _dio?.get(
        "https://api.themoviedb.org/3/movie/$id/credits?language=en-US",
        options: _options,
      );

      final cast = List<Map<String, dynamic>>.from(response?.data["cast"]);
      return Result.ok(cast.map((actor) => Actor.fromJSON(actor)).toList());
    } on DioException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<MovieDetail>> getDetail({required int id}) async {
    try {
      final response = await _dio?.get(
        "https://api.themoviedb.org/3/movie/$id?language=en-US",
        options: _options,
      );

      return Result.ok(MovieDetail.fromJSON(response?.data));
    } on DioException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<List<Movie>>> getNowPlaying({int page = 1}) async {
    try {
      final response = await _dio?.get(
        "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=$page",
        options: _options,
      );

      final movies = List<Map<String, dynamic>>.from(response?.data["results"]);
      return Result.ok(movies.map((movie) => Movie.fromJSON(movie)).toList());
    } on DioException catch (e) {
      return Result.error("${e.message}");
    }
  }

  @override
  Future<Result<List<Movie>>> getUpcoming({int page = 1}) async {
    try {
      final response = await _dio?.get(
        "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=$page",
        options: _options,
      );

      final movies = List<Map<String, dynamic>>.from(response?.data["results"]);
      return Result.ok(movies.map((movie) => Movie.fromJSON(movie)).toList());
    } on DioException catch (e) {
      return Result.error("${e.message}");
    }
  }
}
