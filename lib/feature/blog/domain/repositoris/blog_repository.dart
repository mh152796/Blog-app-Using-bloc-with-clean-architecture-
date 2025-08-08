import 'dart:io';

import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/base/repository.dart';
import '../../../../core/error/failures.dart';

abstract base class BlogRepository extends BaseRepository<BlogEntity>{
  Future<Either<Failures, BlogEntity>> uploadBlog({
    required File images,
    required String title,
    required String content,
    required String posterId,
    required List<String> topics,
  });
}