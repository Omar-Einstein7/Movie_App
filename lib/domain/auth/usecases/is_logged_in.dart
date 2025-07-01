
import 'package:movie_app/core/usecases/usecase.dart';

import '../../../service_locator.dart';
import '../repositories/auth.dart';

class IsLoggedInUseCase extends Usecase<bool,dynamic> {
  
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
  
}