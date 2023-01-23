import 'package:drink_tracker/logic/repositories/authorization_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authorization_state.dart';
part 'authorization_event.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc({
    required this.authorizationRepository,
  }) : super(Unauthenticated()) {
    on<SignInRequested>(
      (event, emit) async {
        emit(AuthorizationLoading());
        try {
          await authorizationRepository.signIn();
          emit(Authenticated());
        } catch (e) {
          emit(AuthorizationError(e.toString()));
          emit(Unauthenticated());
        }
      },
    );

    on<SignOutRequested>(
      (event, emit) async {
        emit(AuthorizationLoading());
        await authorizationRepository.signOut();
        emit(Unauthenticated());
      },
    );
  }

  final AuthorizationRepository authorizationRepository;
}
