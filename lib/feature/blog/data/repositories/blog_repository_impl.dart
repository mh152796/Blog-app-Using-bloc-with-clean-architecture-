import 'dart:io';

import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blog_app/feature/blog/data/model/blog_model.dart';
import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/feature/blog/domain/repositoris/blog_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

final class BlogRepositoryImpl extends BlogRepository {
  final BlogRemoteDataSource blogRemoteDataSource;

  BlogRepositoryImpl(this.blogRemoteDataSource);

  @override
  Future<Either<Failures, BlogEntity>> uploadBlog({
    required File images,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  }) async {
    BlogModel blogModel = BlogModel(
      id: const Uuid().v1(),
      posterId: posterId,
      title: title,
      content: content,
      imageUrl: '',
      topics: topics,
      updatedAt: DateTime.now(),
    );

    return await request(
      request: () async {
        final res = await blogRemoteDataSource.uploadBlogImage(
          file: images,
          blog: blogModel,
        );
        final blog = blogModel.copyWith(imageUrl: res);
        return await blogRemoteDataSource.uploadBlog(blog);
      },
    );
  }
}
