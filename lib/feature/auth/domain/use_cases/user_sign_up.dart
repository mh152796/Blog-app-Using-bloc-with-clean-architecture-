import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/entities/user_entity.dart';

class UserSignUpUseCase implements UseCase<UserEntity, UserEntity>{
  final AuthRepository authRepository;

  const UserSignUpUseCase(this.authRepository);

  @override
  Future<Either<Failures, UserEntity>> call(UserEntity request) async{
    return await authRepository.signUpWithEmailPassword(
        name: request.name ?? "",
        email: request.email,
        password: request.password!
    );
  }

}

