import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_jmot/blocs/auth/auth_bloc.dart';
import 'package:prueba_tecnica_jmot/repositories/auth_repository.dart';
import 'package:prueba_tecnica_jmot/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepository()),
      child: MaterialApp(
        title: 'Flutter Bloc App',
        home: LoginScreen(),
      ),
    );
  }
}