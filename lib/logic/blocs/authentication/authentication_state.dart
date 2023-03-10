part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
}

class AuthenticationUninitialized extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class Unauthenticated extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
