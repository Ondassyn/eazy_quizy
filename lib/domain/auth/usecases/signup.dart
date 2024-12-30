import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/core/usecase/usecase.dart';
import 'package:eazy_quizy/data/auth/models/user_creation_req.dart';
import 'package:eazy_quizy/domain/auth/repository/auth.dart';
import 'package:eazy_quizy/service_locator.dart';

class SignupUseCase implements UseCase<Either, UserCreationReq> {
  @override
  Future<Either> call({UserCreationReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
