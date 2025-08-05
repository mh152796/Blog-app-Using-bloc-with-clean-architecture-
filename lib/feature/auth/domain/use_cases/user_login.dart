import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/entities/user_entity.dart';
import '../repository/auth_repository.dart';

class UserLoginUseCase implements UseCase<UserEntity, UserEntity>{

  final AuthRepository authRepository;

  const UserLoginUseCase(this.authRepository);

  @override
  Future<Either<Failures, UserEntity>> call(UserEntity request) async {
    return await authRepository.loginWithEmailPassword(email: request.email, password: request.password!);
  }


}