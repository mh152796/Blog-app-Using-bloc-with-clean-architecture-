import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blog_app/feature/auth/domain/entities/user_entity.dart';
import 'package:blog_app/feature/auth/domain/use_cases/user_sign_up.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({required UserSignUp userSignUp})
    : _userSignUp = userSignUp,
      super(AuthInitial()) {

    on<AuthSignUp>(signUpEvent);

  }

  Future<void> signUpEvent(event, emit) async {
    emit(AuthLoading());
    final res = await _userSignUp(UserEntity(name: event.name, email: event.email, password: event.password));
     res.fold((failure) => emit(AuthFailure(failure.message)), (user) => emit(AuthSuccess(user)),);
  }
}
