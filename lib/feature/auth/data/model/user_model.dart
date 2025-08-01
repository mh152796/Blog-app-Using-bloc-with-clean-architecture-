// data/models/user_model.dart
import 'package:json_annotation/json_annotation.dart';
import 'package:blog_app/feature/auth/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserResponseModel extends UserEntity {
  const UserResponseModel({
    required super.name,
    required super.email,
    required super.password,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$UserResponseModelFromJson(json);
}
