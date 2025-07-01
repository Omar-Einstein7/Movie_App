import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/domain/tv/repo/tv.dart';
import 'package:movie_app/service_locator.dart';

class GetPopularTvUseCase extends Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<TVRepository>().getPopularTV();
  }
}