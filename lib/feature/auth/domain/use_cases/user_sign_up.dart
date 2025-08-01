import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/auth/domain/entities/user_entity.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserSignUp implements UseCase<UserEntity, UserEntity>{
  final AuthRepository authRepository;

  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failures, UserEntity>> call(UserEntity request) async{
    return await authRepository.signUpWithEmailPassword(
        name: request.name,
        email: request.email,
        password: request.password
    );
  }

}

