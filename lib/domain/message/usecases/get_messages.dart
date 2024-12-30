import 'package:eazy_quizy/core/usecase/usecase.dart';
import 'package:eazy_quizy/domain/message/entity/message.dart';
import 'package:eazy_quizy/domain/message/repository/message.dart';
import 'package:eazy_quizy/service_locator.dart';

class GetMessagesUseCase implements UseCaseStream<MessageEntity, dynamic> {
  @override
  Stream<List<MessageEntity>> call({params}) {
    return sl<MessageRepository>().getMessagesStream();
  }
}
