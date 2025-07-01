import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/tv/repo/tv.dart';
import 'package:movie_app/service_locator.dart';

import '../../../core/usecases/usecase.dart';

class GetSimilarTvsUseCase extends Usecase<Either, int> {
  @override
  Future<Either> call({int ? params}) async {
    return await sl<TVRepository>().getSimilarTVs(params!);
  }
}
