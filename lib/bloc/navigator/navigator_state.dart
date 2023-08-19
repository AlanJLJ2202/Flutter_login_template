part of 'navigator_bloc.dart';


abstract class NavigatorState extends Equatable {
  const NavigatorState();
  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends NavigatorState {}

class LoadingState extends NavigatorState {}

class RegisterState extends NavigatorState {}

class LoginState extends NavigatorState {}

class HomeState extends NavigatorState {}

class AddTransactionState extends NavigatorState {}

class AddCategoryState extends NavigatorState {}

class ProfileState extends NavigatorState {}