import 'dart:io';

import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositoris/blog_repository.dart';

class UploadBlog implements UseCase<UploadBlogParams, BlogEntity> {
  final BlogRepository blogRepository;

  const UploadBlog(this.blogRepository);

  @override
  Future<Either<Failures, BlogEntity>> call(request) async {
    print("vrequestrequestrequestrequestrequestrequestrequestvv ${request.title}");
    print("vrequestrequestrequestrequestrequestrequestrequestvv ${request.content}");
    return await blogRepository.uploadBlog(
      images: request.image,
      title: request.title,
      content: request.content,
      posterId: request.posterId,
      topics: request.topics,
    );
  }
}

class UploadBlogParams {
  final String posterId;
  final String title;
  final String content;
  final File image;
  final List<String> topics;

  UploadBlogParams({
    required this.posterId,
    required this.title,
    required this.content,
    required this.image,
    required this.topics,
  });
}
