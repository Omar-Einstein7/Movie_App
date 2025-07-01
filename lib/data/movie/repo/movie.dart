import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/common/helper/mapper/trailer_mapper.dart';
import 'package:movie_app/core/models/trailer.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/domain/movie/repo/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepoImpl extends MovieRepo {
  @override
  Future<Either> getTrendingMovies() async {
    var returnedData = await sl<MovieService>().getTrendingMovies();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getTNowPlayingMovies() async {
    var returnedData = await sl<MovieService>().getNowPlayingMovies();

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getMovieTrailer(int movieid) async {
    var returnedData = await sl<MovieService>().getMovieTrailer(movieid);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies =
          TrailerMapper.toEntity(TrailerModel.fromJson(data["trailer"]));
      return Right(movies);
    });
  }

  @override
  Future<Either> getRecommendationMovies(int movieid) async {
    var returnedData =
        await sl<MovieService>().getRecommendationMovies(movieid);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }

  @override
  Future<Either> getSimilarMovies(int movieid) async {
    var returnedData = await sl<MovieService>().getSimilarMovies(movieid);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
  
  @override
  Future<Either> SearchMovie(String query) async{
      var returnedData = await sl<MovieService>().SearchMovie(query);

    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      var movies = List.from(data['content'])
          .map((item) => MovieMapper.toEntity(MovieModel.fromJson(item)))
          .toList();
      return Right(movies);
    });
  }
}
