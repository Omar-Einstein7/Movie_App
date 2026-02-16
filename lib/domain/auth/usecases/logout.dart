import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecases/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import '../../../service_locator.dart';

class LogoutUseCase extends Usecase<Either, dynamic> {
  
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().logout();
  }
  
}
