import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/core/usecase/usecase.dart';
import 'package:eazy_quizy/domain/auth/repository/auth.dart';
import 'package:eazy_quizy/service_locator.dart';

class SendPasswordResetEmailUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return sl<AuthRepository>().sendPasswordResetEmail(params!);
  }
}
