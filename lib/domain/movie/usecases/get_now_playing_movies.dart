import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/movie/repo/movie.dart';
import 'package:movie_app/service_locator.dart';

import '../../../core/usecases/usecase.dart';

class GetNowPlayingMoviesUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<MovieRepo>().getTNowPlayingMovies();
  }
}
