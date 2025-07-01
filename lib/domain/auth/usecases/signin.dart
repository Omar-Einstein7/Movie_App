import 'package:dartz/dartz.dart';

import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';

import '../../../data/auth/models/signin_req_params.dart';
import '../../../service_locator.dart';

class SigninUseCase extends Usecase<Either,SigninReqParams> {
  
  @override
  Future<Either> call({SigninReqParams? params}) async {
    return await sl<AuthRepository>().signin(params!);
  }
  
}