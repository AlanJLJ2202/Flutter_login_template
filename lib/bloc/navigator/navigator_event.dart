part of 'navigator_bloc.dart';


abstract class NavigatorEvent extends Equatable {
  const NavigatorEvent();

  @override
  List<Object> get props => [];
}

class LoadNavigator extends NavigatorEvent {}

class GoLogin extends NavigatorEvent {}

class GoRegister extends NavigatorEvent {}

class GoHome extends NavigatorEvent {}

class GoAddTransaction extends NavigatorEvent {}

class GoAddCategory extends NavigatorEvent {}

class GoProfile extends NavigatorEvent {}
