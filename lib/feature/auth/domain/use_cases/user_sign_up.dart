import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/core/error/failures.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class UserSignUp implements UseCase<String, UserSignUpEntity>{
  final AuthRepository authRepository;

  const UserSignUp(this.authRepository);

  @override
  Future<Either<Failures, String>> call(UserSignUpEntity request) async{
    return await authRepository.signUpWithEmailPassword(
        name: request.name,
        email: request.email,
        password: request.password
    );
  }

}

class UserSignUpEntity {
  final String name;
  final String email;
  final String password;

  UserSignUpEntity(this.name, this.email, this.password);
}