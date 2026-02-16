import 'package:dartz/dartz.dart';

import 'package:movie_app/domain/tv/repo/tv.dart';
import 'package:movie_app/service_locator.dart';

import '../../../core/usecases/usecase.dart';

class SearchTvUsecase extends Usecase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<TVRepository>().searchTV(params!);
  }
}
