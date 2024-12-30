import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/domain/message/entity/message.dart';

abstract class MessageRepository {
  Stream<List<MessageEntity>> getMessagesStream();
  Future<void> pushMessage(MessageEntity message);
}
