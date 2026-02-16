import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/movie/repo/movie.dart';
import 'package:movie_app/service_locator.dart';

import '../../../core/usecases/usecase.dart';

class SearchMoviesUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<MovieRepo>().searchMovie(params!);
  }
}
