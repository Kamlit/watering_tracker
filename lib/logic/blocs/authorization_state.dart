part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationState extends Equatable {}

class AuthorizationLoading extends AuthorizationState {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthorizationState {
  @override
  List<Object?> get props => [];
}

class Unauthenticated extends AuthorizationState {
  @override
  List<Object?> get props => [];
}

class AuthorizationError extends AuthorizationState {
  AuthorizationError(this.error);

  final String error;

  @override
  List<Object?> get props => [error];
}
