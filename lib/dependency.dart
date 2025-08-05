import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/feature/auth/domain/use_cases/current_user.dart';
import 'package:blog_app/feature/auth/domain/use_cases/user_login.dart';
import 'package:blog_app/feature/auth/domain/use_cases/user_sign_up.dart';
import 'package:blog_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/app_secrets/app_secrets.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {
  final Supabase supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton(() => AppUserCubit(),);
  _initAuth();
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(serviceLocator()),
    )
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator()),
    )
    ..registerFactory(() => UserSignUpUseCase(serviceLocator()))
    ..registerFactory(() => UserLoginUseCase(serviceLocator()))
    ..registerFactory(() => CurrentUserUseCase(serviceLocator()))
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogIn: serviceLocator(),
        currentUserUseCase: serviceLocator(),
        appUserCubit: serviceLocator()
      ),
    );
}
