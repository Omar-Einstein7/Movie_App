import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';

import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/movie/repo/movie.dart';
import 'package:movie_app/data/movie/sources/movie.dart';
import 'package:movie_app/data/tv/repo/tv.dart';
import 'package:movie_app/data/tv/sources/tv.dart';

import 'package:movie_app/domain/auth/usecases/is_logged_in.dart';

import 'package:movie_app/domain/auth/usecases/signup.dart';
import 'package:movie_app/domain/movie/repo/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_movie_trailer.dart';
import 'package:movie_app/domain/movie/usecases/get_now_playing_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_reommendation_movie.dart';
import 'package:movie_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movies.dart';
import 'package:movie_app/domain/movie/usecases/search_movies.dart';
import 'package:movie_app/domain/tv/repo/tv.dart';
import 'package:movie_app/domain/tv/usecases/get_keywords.dart';
import 'package:movie_app/domain/tv/usecases/get_popular_tv.dart';
import 'package:movie_app/domain/tv/usecases/get_recommendations_tvs.dart';
import 'package:movie_app/domain/tv/usecases/get_similar_tvs.dart';
import 'package:movie_app/domain/tv/usecases/search_tv.dart';

import 'data/auth/repositories/auth.dart';
import 'domain/auth/repositories/auth.dart';
import 'domain/auth/usecases/signin.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioClient>(DioClient());

  //Services
  sl.registerSingleton<AuthService>(AuthApiServiceImpl());
  sl.registerSingleton<MovieService>(MovieApiServiceImpl());
  sl.registerSingleton<TVService>(TVApiServiceImpl());

  //Repo
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepo>(MovieRepoImpl());
  sl.registerSingleton<TVRepository>(TVRepositoryImpl());

  //Usecases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetTrandingMoviesUseCases>(GetTrandingMoviesUseCases());
  sl.registerSingleton<GetNowPlayingMoviesUseCase>(
      GetNowPlayingMoviesUseCase());
  sl.registerSingleton<GetPopularTvUseCase>(GetPopularTvUseCase());
  sl.registerSingleton<GetMovieTrailerUseCase>(GetMovieTrailerUseCase());
  sl.registerSingleton<GetReommendationMovieUseCase>(
      GetReommendationMovieUseCase());
  sl.registerSingleton<GetSimilarMoviesUseCase>(GetSimilarMoviesUseCase());
  sl.registerSingleton<GetSimilarTvsUseCase>(GetSimilarTvsUseCase());
  sl.registerSingleton<GetRecommendationsTvsUseCase>(
      GetRecommendationsTvsUseCase());
  sl.registerSingleton<GetTVKeywordsUseCase>(GetTVKeywordsUseCase());

  sl.registerSingleton<SearchMoviesUsecase>(SearchMoviesUsecase());
  sl.registerSingleton<SearchTvUsecase>(SearchTvUsecase());
}
