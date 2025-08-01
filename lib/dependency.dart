import 'package:blog_app/feature/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:blog_app/feature/auth/domain/repository/auth_repository.dart';
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

  serviceLocator.registerLazySingleton(()=> supabase.client);
  _initAuth();

}

void _initAuth(){
  serviceLocator.registerFactory<AuthRemoteDataSource>(()=> AuthRemoteDataSourceImpl(serviceLocator()));
  serviceLocator.registerFactory<AuthRepository>(()=> AuthRepositoryImpl(serviceLocator()));
  serviceLocator.registerFactory(()=> UserSignUp(serviceLocator()));

  serviceLocator.registerLazySingleton(()=> AuthBloc(userSignUp: serviceLocator()));
}