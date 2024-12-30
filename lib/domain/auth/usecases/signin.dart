import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/core/usecase/usecase.dart';
import 'package:eazy_quizy/data/auth/models/user_signin_req.dart';
import 'package:eazy_quizy/domain/auth/repository/auth.dart';
import 'package:eazy_quizy/service_locator.dart';

class SigninUseCase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
