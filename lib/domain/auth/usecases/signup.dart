import 'package:dartz/dartz.dart';

import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';

import '../../../service_locator.dart';
import '../repositories/auth.dart';

class SignupUseCase extends Usecase<Either,SignupReqParams> {
  
  @override
  Future<Either> call({SignupReqParams? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
  
}