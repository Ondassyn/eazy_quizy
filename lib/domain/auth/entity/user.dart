class UserEntity {
  final String userId;
  // final String firstName;
  // final String lastName;
  final String? username;
  final String email;
  final String? image;
  final String role;
  // final int gender;

  UserEntity({
    required this.userId,
    // required this.firstName,
    // required this.lastName,
    this.username,
    required this.email,
    this.image,
    required this.role,
    // required this.gender
  });
}
