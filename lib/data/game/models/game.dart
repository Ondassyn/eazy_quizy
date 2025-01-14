// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eazy_quizy/domain/game/entity/game.dart';

class GameModel {
  final String uid;
  final String title;
  final Timestamp createdAt;
  final String? image;

  GameModel(
      {required this.uid,
      required this.title,
      required this.createdAt,
      this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'title': title,
      'createdAt': createdAt,
      'image': image,
    };
  }

  factory GameModel.fromMap(Map<String, dynamic> map) {
    return GameModel(
      uid: map['uid'] as String,
      title: map['title'] as String,
      createdAt: map['createdAt'] as Timestamp,
      image: map['image'] != null ? map['image'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameModel.fromJson(String source) =>
      GameModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on GameModel {
  GameEntity toEntity() {
    return GameEntity(
      uid: uid,
      title: title,
      createdAt: createdAt,
      image: image,
    );
  }
}
