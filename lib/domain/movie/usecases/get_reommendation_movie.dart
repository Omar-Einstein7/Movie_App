import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/movie/repo/movie.dart';
import 'package:movie_app/service_locator.dart';

import '../../../core/usecases/usecase.dart';

class GetReommendationMovieUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call({int ? params}) async {
    return await sl<MovieRepo>().getRecommendationMovies(params!);
  }
}
