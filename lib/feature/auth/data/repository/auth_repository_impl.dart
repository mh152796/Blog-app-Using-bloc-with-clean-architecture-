import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/domain/entities/user_entity.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  Future<Either<Failures, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await _getUser(
      fn: () async => await authRemoteDataSource.loginWithEmailPassword(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failures, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    return await _getUser(
      fn: () async => await authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failures, UserEntity>> _getUser({
    required Future<UserEntity> Function() fn,
  }) async {
    try {
      final user = await fn();
      return Right(user);
    } on ServerException catch (e) {
      return Left(Failures(500, e.message));
    }
  }
}
