import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/entities/user_entity.dart';

class CurrentUserUseCase implements UseCase<NoParams, UserEntity>{

  final AuthRepository authRepository;
  const CurrentUserUseCase(this.authRepository);

  @override
  Future<Either<Failures, UserEntity>> call(NoParams noParams) {
    return authRepository.getCurrentUser();
  }

}