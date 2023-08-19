
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  AuthenticationBloc() : super(LoadingState()){

    on<LoadAuthentication>((event, emit) {
      emit(LoadingState());
    });

    on<AppStarted>((event, emit) {
      emit(UnauthenticatedState());
    });

    on<LoginEvent>((event, emit) {
      //emit(AuthenticatedState());
    });

    on<RegisterEvent>((event, emit) {
      //emit(AuthenticatedState());
    });

    on<LogoutEvent>((event, emit) {
      emit(UnauthenticatedState());
    });
  }

}