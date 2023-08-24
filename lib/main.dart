import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_app/screens/home_screen.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/navigator/navigator_bloc.dart';
import 'resources/repository.dart';
import 'screens/login_screen.dart';

void main() {
  final repository = Repository();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {

  final Repository repository;
  const MyApp({super.key, required this.repository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return NavigatorBloc();
        }),
        BlocProvider(
          create: (context){
            return AuthenticationBloc(repository: repository)..add(AppStarted());
          },
        ),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is UnauthenticatedState || state is LoginState) {
              return LoginScreen();
            }
            if (state is RegisterState){
              //return RegisterScreen();
            }
            if (state is AuthenticatedState) {
              return const App();
            }
            if (state is AuthLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )
      ),
    );
  }
}


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigatorBloc, NavigatorxState>(
      builder: (context, state) {
        if (state is HomeState){
          return const HomeScreen();
        }
        /*if (state is StateDoctores){
          return DoctoresScreen(repository, state.servicio);
        }
        if (state is StateAgendar){
          return AgendarScreen(repository, state.servicio, state.doctor);
        }*/
        return const Center(child: CircularProgressIndicator());
      }


    );
  }

}




