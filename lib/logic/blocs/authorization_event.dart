part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class SignInRequested extends AuthorizationEvent {}

class SignOutRequested extends AuthorizationEvent {}
