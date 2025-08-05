import 'package:blog_app/core/base/repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/entities/user_entity.dart';
import '../../../../core/error/failures.dart';

abstract base class AuthRepository extends BaseRepository<UserEntity>{
  Future<Either<Failures, UserEntity>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failures, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures, UserEntity>> getCurrentUser();
}

