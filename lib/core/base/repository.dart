import 'package:dartz/dartz.dart';
import '../error/exceptions.dart';
import '../error/failures.dart';

abstract class BaseRepository{
  Future<Either<Failures, T>> request<T>({
    required Future<T> Function() request,
  }) async {
    try {
      final res = await request();
      return Right(res);
    } on ServerException catch (e) {
      return Left(Failures(500, e.message));
    }
  }
}
