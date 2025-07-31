import 'package:blog_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class UseCase<Response, Request> {
  Future<Either<Failures, Response>> call(Request request);
}
