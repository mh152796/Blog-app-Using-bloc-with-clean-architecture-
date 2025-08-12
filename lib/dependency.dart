import 'package:blog_app/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
import 'package:blog_app/feature/auth/domain/use_cases/current_user.dart';
import 'package:blog_app/feature/auth/domain/use_cases/user_login.dart';
import 'package:blog_app/feature/auth/domain/use_cases/user_sign_up.dart';
import 'package:blog_app/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:blog_app/feature/blog/data/datasources/blog_remote_data_source.dart';
import 'package:blog_app/feature/blog/data/repositories/blog_repository_impl.dart';
import 'package:blog_app/feature/blog/domain/repositoris/blog_repository.dart';
import 'package:blog_app/feature/blog/domain/use_case/get_all_blogs.dart';
import 'package:blog_app/feature/blog/presentation/bloc/blog_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'core/app_secrets/app_secrets.dart';
import 'feature/blog/domain/use_case/upload_blog.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependency() async {
  final Supabase supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnonKey,
  );

  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton(() => AppUserCubit());
  _initAuth();
  initBlog();
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
        appUserCubit: serviceLocator(),
      ),
    );
}

void initBlog() {
  //data source
  serviceLocator
    ..registerFactory<BlogRemoteDataSource>(
      () => BlogRemoteDataSourceImpl(serviceLocator()),
    )
    //repository
    ..registerFactory<BlogRepository>(
      () => BlogRepositoryImpl(serviceLocator()),
    )
    //use case
    ..registerFactory(() => UploadBlog(serviceLocator()))
    ..registerFactory(()=> GetAllBlogs(serviceLocator()))
    //bloc
    ..registerLazySingleton(() => BlogBloc(uploadBlog: serviceLocator(), getAllBlog: serviceLocator()));
}
