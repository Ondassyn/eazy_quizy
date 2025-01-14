// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class GameEntity {
  final String uid;
  final String title;
  final Timestamp createdAt;
  final String? image;

  GameEntity(
      {required this.uid,
      required this.title,
      required this.createdAt,
      this.image});
}
