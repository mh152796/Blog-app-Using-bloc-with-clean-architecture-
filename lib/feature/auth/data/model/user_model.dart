import 'package:json_annotation/json_annotation.dart';

import '../../../../core/common/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserResponseModel extends UserEntity {
  const UserResponseModel({
    required super.name,
    required super.email,
    super.password,
    super.id,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);

  UserResponseModel copyWith({
    String? name,
    String? email,
    String? id,
    String? password,
  }) {
    return UserResponseModel(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
      password: password ?? this.password,
    );
  }
}
