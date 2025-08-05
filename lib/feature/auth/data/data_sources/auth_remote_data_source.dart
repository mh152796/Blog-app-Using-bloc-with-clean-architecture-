import 'package:blog_app/core/error/exceptions.dart';
import 'package:blog_app/feature/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

abstract interface class AuthRemoteDataSource {
  sb.Session? get currentUserSession;

  Future<UserResponseModel> signUpWithEmailPassword({
    required name,
    required email,
    required password,
  });

  Future<UserResponseModel> loginWithEmailPassword({
    required email,
    required password,
  });

  Future<UserResponseModel> getCurrentUserData();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final sb.SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  sb.Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserResponseModel> loginWithEmailPassword({
    required email,
    required password,
  }) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user == null) {
        throw const ServerException("User is null");
      }
      return UserResponseModel.fromJson(response.user!.toJson());
    } on sb.AuthException catch (e) {
      throw ServerException(e.message);
    } on ServerException catch (e) {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserResponseModel> signUpWithEmailPassword({
    required name,
    required email,
    required password,
  }) async {
    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {'name': name},
      );
      if (response.user == null) {
        throw const ServerException("User is null");
      }
      print("responseresponse ${response.user}");
      return UserResponseModel.fromJson(response.user!.toJson());
    } on sb.AuthException catch (e) {
      print("Errrrrrrrrrrrrrrror $e");

      throw ServerException(e.message);
    }
     on ServerException catch (e) {
       print("Errrrrrrrrrrrrrrror $e");
       rethrow;
    } catch (e) {
      print("Errrrrrrrrrrrrrrror $e");
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserResponseModel> getCurrentUserData() async {
    try {
      if (currentUserSession != null) {
        final userData = await supabaseClient
            .from("profiles")
            .select()
            .eq('id', currentUserSession!.user.id);
        userData.first['email'] ??= '';
          return UserResponseModel.fromJson(userData.first).copyWith(email: currentUserSession!.user.email);
      }
       else{
        throw ServerException("User is not logged in!");
      }
     } on sb.AuthException catch (e) {
      print("Errrrrrrrrrrrrrrror $e");

      throw ServerException(e.message);
    } on ServerException catch (e) {
      print("Errrrrrrrrrrrrrrror $e");
      rethrow;
    } catch (e) {
      print("Errrrrrrrrrrrrrrror $e");
      throw ServerException(e.toString());
    }
  }
}
