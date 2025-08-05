import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blog_app/core/base/use_case.dart';
import 'package:blog_app/feature/auth/domain/use_cases/user_login.dart';
import 'package:blog_app/feature/auth/domain/use_cases/user_sign_up.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/cubits/app_user/app_user_cubit.dart';
import '../../../../core/common/entities/user_entity.dart';
import '../../domain/use_cases/current_user.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpUseCase _userSignUp;
  final UserLoginUseCase _userLogin;
  final CurrentUserUseCase _currentUserUseCase;
  final AppUserCubit _appUserCubit;

  AuthBloc({
    required UserLoginUseCase userLogIn,
    required UserSignUpUseCase userSignUp,
    required CurrentUserUseCase currentUserUseCase,
    required AppUserCubit appUserCubit,
  }) : _userSignUp = userSignUp,
       _userLogin = userLogIn,
       _currentUserUseCase = currentUserUseCase,
       _appUserCubit = appUserCubit,
       super(AuthInitial()) {
    on<AuthSignUpEvent>(_signUpEvent);
    on<AuthLogInEvent>(_logInEvent);
    on<AuthIsUserLoggedInEvent>(_isUserLoggedIn);
  }

  Future<void> _signUpEvent(
    AuthSignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final res = await _userSignUp(
      UserEntity(
        name: event.name,
        email: event.email,
        password: event.password,
      ),
    );
     res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<void> _logInEvent(
    AuthLogInEvent event,
    Emitter<AuthState> emit,
  ) async {
     emit(AuthLoading());
    final res = await _userLogin(
      UserEntity(email: event.email, password: event.password),
    );
     res.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  Future<void> _isUserLoggedIn(
    AuthIsUserLoggedInEvent event,
    Emitter<AuthState> emit,
  ) async {
    final res = await _currentUserUseCase(NoParams());
    res.fold((l) => emit(AuthFailure(l.message)), (r) => _emitAuthSuccess(r, emit),);
  }

  void _emitAuthSuccess(UserEntity user, Emitter<AuthState> emit){
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }

}
