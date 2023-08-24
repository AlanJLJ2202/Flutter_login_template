part of 'navigator_bloc.dart';


abstract class NavigatorxState extends Equatable {
  const NavigatorxState();
  @override
  List<Object> get props => [];
}

class LoadingState extends NavigatorxState {}

class HomeState extends NavigatorxState {}

class AddTransactionState extends NavigatorxState {}

class AddCategoryState extends NavigatorxState {}

class ProfileState extends NavigatorxState {}