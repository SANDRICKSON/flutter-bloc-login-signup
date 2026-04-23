import 'package:bloc_login_register_flutter/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:bloc_login_register_flutter/screens/home_screen.dart';
import 'package:bloc_login_register_flutter/screens/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: Colors.white,
          onBackground: Colors.black,
          primary: Color.fromRGBO(206,147,216,1),
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(233, 143, 177, 1),
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255,204,228,1),
          error: Colors.red,
          outline: Color(0XFF424242)
        )
      ),
      home: BlocBuilder<AuthenticationBloc,AuthenticationState>(builder: (context,state){
        if (state.status == AuthenticationStatus.authenticated) {
          return const HomeScreen();
        } else {
          return const WelcomeScreen();
        }
      }),
    );
  }
}

