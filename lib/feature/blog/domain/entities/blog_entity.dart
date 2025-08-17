class BlogEntity {
  final String id;
  final String posterId;
  final String title;
  final String content;
  final String imageUrl;
  final String? posterName;
  final List<String> topics;
  final DateTime updatedAt;

  BlogEntity(
    this.id,
    this.posterId,
    this.title,
    this.content,
    this.imageUrl,
    this.topics,
    this.updatedAt,
    this.posterName,
  );
}
