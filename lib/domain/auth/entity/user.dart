class UserEntity {
  final String uid;
  final String? username;
  final String email;
  final String? image;
  final String role;

  UserEntity({
    required this.uid,
    this.username,
    required this.email,
    this.image,
    required this.role,
  });
}
