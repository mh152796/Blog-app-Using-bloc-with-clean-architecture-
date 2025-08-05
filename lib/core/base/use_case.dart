import 'package:blog_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract interface class UseCase<Request, Response> {
  Future<Either<Failures, Response>> call(Request request);
}

class NoParams {}
