import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigator_event.dart';
part 'navigator_state.dart';

class NavigatorBloc extends Bloc<NavigatorEvent, NavigatorxState>{

  NavigatorBloc() : super(LoadingState()){

    on<LoadNavigator>((event, emit) {
      emit(LoadingState());
    });

    /*on<GoLogin>((event, emit) {
      emit(LoginState());
    });

    on<GoRegister>((event, emit) {
      emit(RegisterState());
    });*/

    on<GoHome>((event, emit) {
      emit(HomeState());
    });

    on<GoAddTransaction>((event, emit) {
      emit(AddTransactionState());
    });

    on<GoAddCategory>((event, emit) {
      emit(AddCategoryState());
    });

    on<GoProfile>((event, emit) {
      emit(ProfileState());
    });
  }
}