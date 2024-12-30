import 'package:dartz/dartz.dart';
import 'package:firebase_database/firebase_database.dart';

abstract class MessageFirebaseService {
  Stream<List<Map<dynamic, dynamic>>> getMessagesStream();
  Future<void> pushMessage(Map<String, dynamic> message);
}

class MessageFirebaseServiceImpl extends MessageFirebaseService {
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  @override
  Stream<List<Map<dynamic, dynamic>>> getMessagesStream() {
    return _database.ref('messages').onChildAdded.map((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>?;
      return [
        {
          "id": event.snapshot.key,
          "text": data!["text"],
          "author": data["author"],
          "createdAt": DateTime.parse(data["createdAt"]),
        }
      ];
    });
  }

  @override
  Future<void> pushMessage(Map<String, dynamic> message) async {
    await _database.ref('messages').push().set(message);
  }
}
