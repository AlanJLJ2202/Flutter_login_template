part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();
  @override
  List<Object> get props => [];
}

class LoadingState extends AuthenticationState {}
class UnauthenticatedState extends AuthenticationState {}
class AuthenticatedState extends AuthenticationState {}

