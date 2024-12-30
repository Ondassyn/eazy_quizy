import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/core/usecase/usecase.dart';
import 'package:eazy_quizy/domain/auth/repository/auth.dart';
import 'package:eazy_quizy/service_locator.dart';

class GetAgesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getAges();
  }
}
