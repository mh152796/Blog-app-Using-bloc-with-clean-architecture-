class UserEntity {
  final String? name;
  final String? id;
  final String email;
  final String? password;

  const UserEntity({this.name, required this.email, this.id, this.password});
}
