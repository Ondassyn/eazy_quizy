import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/core/usecase/usecase.dart';
import 'package:eazy_quizy/domain/message/entity/message.dart';
import 'package:eazy_quizy/domain/message/repository/message.dart';
import 'package:eazy_quizy/service_locator.dart';

class PushMessageUseCase implements UseCase<dynamic, MessageEntity> {
  @override
  Future<void> call({MessageEntity? params}) async {
    await sl<MessageRepository>().pushMessage(params!);
  }
}
