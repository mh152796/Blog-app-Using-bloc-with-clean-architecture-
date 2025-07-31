import 'package:blog_app/core/error/exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> signUpWithEmailPassword({
    required name,
    required email,
    required password,
  });

  Future<String> loginWithEmailPassword({required email, required password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<String> loginWithEmailPassword({required email, required password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailPassword({
    required name,
    required email,
    required password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(email: email, password: password, data: {'name': name});
     if(response.user == null){
       throw const ServerException("User is null");
     }
     return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
