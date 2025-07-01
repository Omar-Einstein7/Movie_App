import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/constants/api_url.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/service_locator.dart';

abstract class TVService {
  Future<Either> getPopularTv();
  Future<Either> getRecommendationTVs(int tvId);
  Future<Either> getSimilarTVs(int tvId);
  Future<Either> getKeyword(int tvId);
  Future<Either> seacrhTV(String query);
}

class TVApiServiceImpl extends TVService {
  @override
  Future<Either> getPopularTv() async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrl.popularTV,
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getRecommendationTVs(int tvId) async{
       try {
      var response = await sl<DioClient>().get(
        ApiUrl.tv + "$tvId/recommendations",
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> getSimilarTVs(int tvId) async{
      try {
      var response = await sl<DioClient>().get(
        ApiUrl.tv + "$tvId/similar",
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> getKeyword(int tvId)async {
      try {
      var response = await sl<DioClient>().get(
        ApiUrl.tv + "$tvId/keywords",
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  
  @override
  Future<Either> seacrhTV(String query) async{
 try {
      var response = await sl<DioClient>().get(
        ApiUrl.search + "tv/${query}",
      );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
