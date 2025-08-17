import 'package:json_annotation/json_annotation.dart';
import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';

part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel extends BlogEntity {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'poster_id')
  final String posterId;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'content')
  final String content;

  @JsonKey(name: 'image_url')
  final String imageUrl;

  @JsonKey(name: 'topics')
  @JsonKey(defaultValue: [])
  final List<String> topics;

  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @JsonKey(name: 'name', includeFromJson: true, includeToJson: false)
  final String? posterName;

  BlogModel({
    required this.id,
    required this.posterId,
    required this.title,
    required this.content,
    required this.imageUrl,
    required this.topics,
    required this.updatedAt,
     this.posterName,
  }) : super(id, posterId, title, content, imageUrl, topics, updatedAt, posterName);

  factory BlogModel.fromJson(Map<String, dynamic> json) {
    json['updated_at'] ??= DateTime.now().toIso8601String();
    return _$BlogModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BlogModelToJson(this);

  BlogModel copyWith({
    String? id,
    String? posterId,
    String? title,
    String? content,
    String? imageUrl,
    List<String>? topics,
    DateTime? updatedAt,
    String? posterName,
  }) {

    return BlogModel(
      id: id ?? this.id,
      posterId: posterId ?? this.posterId,
      title: title ?? this.title,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      topics: topics ?? this.topics,
      updatedAt: updatedAt ?? this.updatedAt,
      posterName: posterName ?? this.posterName,
    );
  }
}
