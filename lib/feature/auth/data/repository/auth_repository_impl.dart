import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/entities/user_entity.dart';

final class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl(this.authRemoteDataSource);


  @override
  Future<Either<Failures, UserEntity>> getCurrentUser() async {
    return await request(
      request: () async => await authRemoteDataSource.getCurrentUserData(),
    );
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    return await request(
      request: () async => await authRemoteDataSource.loginWithEmailPassword(
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
    return await request(
      request: () async => await authRemoteDataSource.signUpWithEmailPassword(
        name: name,
        email: email,
        password: password,
      ),
    );
  }

}
