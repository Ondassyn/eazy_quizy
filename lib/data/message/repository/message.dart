import 'package:dartz/dartz.dart';
import 'package:eazy_quizy/data/message/models/message.dart';
import 'package:eazy_quizy/data/message/source/message_firebase_service.dart';
import 'package:eazy_quizy/domain/message/entity/message.dart';
import 'package:eazy_quizy/domain/message/repository/message.dart';
import 'package:eazy_quizy/service_locator.dart';

class MessageRepositoryImpl extends MessageRepository {
  @override
  Stream<List<MessageEntity>> getMessagesStream() {
    return sl<MessageFirebaseService>().getMessagesStream().map((messageList) {
      return messageList
          .map((message) => MessageEntity(
                id: message["id"],
                text: message["text"],
                author: message["author"],
                createdAt: message["createdAt"],
              ))
          .toList();
    });
  }

  @override
  Future<void> pushMessage(MessageEntity message) async {
    await sl<MessageFirebaseService>().pushMessage({
      "text": message.text,
      "author": message.author,
      "createdAt": message.createdAt.toIso8601String(),
    });
  }
}
