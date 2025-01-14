// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eazy_quizy/domain/auth/entity/user.dart';

class UserModel {
  final String uid;
  final String? username;
  final String email;
  final String? image;
  final String role;

  UserModel({
    required this.uid,
    this.username,
    required this.email,
    this.image,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'username': username,
      'email': email,
      'image': image,
      'role': role,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      role: map['role'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      username: username,
      email: email,
      image: image,
      role: role,
    );
  }
}
