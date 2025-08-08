import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blog_app/feature/blog/domain/use_case/upload_blog.dart';
import 'package:meta/meta.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog uploadBlog;

  BlogBloc(this.uploadBlog) : super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUploadEvent>(_uploadBlog);
  }

  Future<void> _uploadBlog(
    BlogUploadEvent event,
    Emitter<BlogState> emit,
  ) async {
    final res = await uploadBlog(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );

    res.fold((l) => emit(BlogFailure(l.message)), (r) => emit(BlogSuccess()));
  }
}
