import 'package:drink_tracker/logic/repositories/authorization_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_state.dart';
part 'authentication_event.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required this.authorizationRepository,
  }) : super(AuthenticationUninitialized()) {
    on<AppStarted>(_onAppStarted);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  void _onAppStarted(
    AppStarted event,
    Emitter<AuthenticationState> emit,
  ) {
    bool isUserLogged;
    if (FirebaseAuth.instance.currentUser != null) {
      isUserLogged = true;
    } else {
      isUserLogged = false;
    }
    if (isUserLogged) {
      emit(Authenticated());
    } else {
      emit(Unauthenticated());
    }
    print(isUserLogged);
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    try {
      await authorizationRepository.signIn();
      emit(Authenticated());
    } catch (e) {
      emit(AuthenticationError(e.toString()));
      emit(Unauthenticated());
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    await authorizationRepository.signOut();
    emit(Unauthenticated());
  }

  final AuthorizationRepository authorizationRepository;
}
