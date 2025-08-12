import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/feature/blog/domain/use_case/get_all_blogs.dart';
import 'package:blog_app/feature/blog/domain/use_case/upload_blog.dart';
import 'package:meta/meta.dart';

part 'blog_event.dart';

part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;

  BlogBloc({required UploadBlog uploadBlog, required GetAllBlogs getAllBlog})
    : _uploadBlog = uploadBlog,
      _getAllBlogs = getAllBlog,
      super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUploadEvent>(_onUploadBlog);
    on<BlogFetchAllBlogs>(_onFetchAllBlogs);
  }

  Future<void> _onUploadBlog(
    BlogUploadEvent event,
    Emitter<BlogState> emit,
  ) async {
    final res = await _uploadBlog(
      UploadBlogParams(
        posterId: event.posterId,
        title: event.title,
        content: event.content,
        image: event.image,
        topics: event.topics,
      ),
    );

    res.fold((l) => emit(BlogFailure(l.message)), (r) => emit(BlogUploadSuccess()));
  }

  Future<void> _onFetchAllBlogs(
    BlogFetchAllBlogs event,
    Emitter<BlogState> emit,
  ) async {
    final res = await _getAllBlogs(NoParams());
    res.fold((l) => emit(BlogFailure(l.message)), (r) => emit(BlogDisPlaySuccess(r)),);
  }
}
