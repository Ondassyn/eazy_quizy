// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eazy_quizy/domain/message/entity/message.dart';

class MessageModel {
  final String id;
  final String author;
  final String text;
  final DateTime createdAt;

  MessageModel(
      {required this.id,
      required this.author,
      required this.text,
      required this.createdAt});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'author': author,
      'text': text,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  String toJson() => json.encode(toMap());
}

extension ProductXModel on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(
        id: id, author: author, text: text, createdAt: createdAt);
  }
}
