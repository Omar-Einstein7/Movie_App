import 'package:dartz/dartz.dart';

abstract class MovieRepo {
  Future<Either> getTrendingMovies();
  Future<Either> getTNowPlayingMovies();
  Future<Either> getMovieTrailer(int movieid);
  Future<Either> getRecommendationMovies(int movieid);
  Future<Either> getSimilarMovies(int movieid);
  Future<Either> SearchMovie(String query);
}
