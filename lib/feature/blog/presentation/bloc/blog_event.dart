part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class BlogUploadEvent extends BlogEvent {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  BlogUploadEvent(this.posterId, this.title, this.content, this.image, this.topics);
}

final class BlogFetchAllBlogs extends BlogEvent{}
