import 'package:eazy_quizy/core/usecase/usecase.dart';
import 'package:eazy_quizy/domain/auth/repository/auth.dart';
import 'package:eazy_quizy/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
