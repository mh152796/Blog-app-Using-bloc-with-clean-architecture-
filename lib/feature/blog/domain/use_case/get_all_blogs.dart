import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/blog/domain/entities/blog_entity.dart';
import 'package:blog_app/feature/blog/domain/repositoris/blog_repository.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/base/use_case.dart';

class GetAllBlogs implements UseCase<NoParams, List<BlogEntity>> {
  final BlogRepository blogRepository;

  const GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Failures, List<BlogEntity>>> call(request) {
    return blogRepository.getAllBlogs();
  }
}
