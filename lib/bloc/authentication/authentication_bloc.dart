
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:t_app/resources/sqlite_provider.dart';

import '../../resources/repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {

  final Repository repository;
  final SQLiteProvider mySQLProvider = SQLiteProvider();

  AuthenticationBloc({required this.repository}) : super(AuthLoadingState()){

    on<LoadAuthentication>((event, emit) {
      emit(AuthLoadingState());
    });

    on<AppStarted>((event, emit) async {
      bool token = await mySQLProvider.hasInternalToken();
      if(token){
        emit(AuthenticatedState());
      }else{
        emit(UnauthenticatedState());
      }
    });

    on<LoginTapEvent>((event, emit) {
      emit(LoginState());
    });

    on<LoginEvent>((event, emit) async {

      emit(AuthLoadingState());

      try{

        final data = await repository.LoginAPI(event.email, event.password);
        print("SE EJECUTA EN EL BLOC");
        print(data);

        /*if(data['estatus'] ){
          await mySQLProvider.deleteInternalUser();



          /*UserColaborador colaborador = data['user'];

          if(colaborador.confirmado == 0) {
            Fluttertoast.showToast(msg: "Cuenta no confirmada, revisa tu correo electrónico", backgroundColor: Colors.red, textColor: Colors.white);
            emit(InicioSesion());
          }else{
            User user = User(id: 1, tipo: data['tipo'], accessToken: data['access_token']);
            print(user.toMap());

            await repository.saveInternalUser(user);
            emit(Authenticated());
            print('dentro');
          }*/

        }else{
          Fluttertoast.showToast(msg: "Credenciales incorrectas", backgroundColor: Colors.red, textColor: Colors.white);
          emit(LoginState());
        }*/

      }catch(e){
        Fluttertoast.showToast(msg: "Ocurrió un error al hacer el inicio de sesión", backgroundColor: Colors.red, textColor: Colors.white);
        emit(LoginState());
      }


    });

    on<RegisterTapEvent>((event, emit) {
      emit(RegisterState());
    });

    on<RegisterEvent>((event, emit) {
      //emit(AuthenticatedState());
    });

    on<LogoutEvent>((event, emit) {
      emit(UnauthenticatedState());
    });
  }

}