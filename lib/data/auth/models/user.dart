// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:eazy_quizy/domain/auth/entity/user.dart';

class UserModel {
  final String userId;
  // final String firstName;
  // final String lastName;
  final String? username;
  final String email;
  final String? image;
  final String role;
  // final int gender;

  UserModel({
    required this.userId,
    // required this.firstName,
    // required this.lastName,
    this.username,
    required this.email,
    this.image,
    required this.role,
    // required this.gender
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      // 'firstName': firstName,
      // 'lastName': lastName,
      'username': username,
      'email': email,
      'image': image,
      'role': role,
      // 'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userId: map['userId'] as String,
      // firstName: map['firstName'] as String,
      // lastName: map['lastName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      image: map['image'] ?? '',
      role: map['role'] ?? '',
      // gender: map['gender'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension UserXModel on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      userId: userId,
      // firstName: firstName,
      // lastName: lastName,
      username: username,
      email: email,
      image: image,
      role: role,
      // gender: gender
    );
  }
}
