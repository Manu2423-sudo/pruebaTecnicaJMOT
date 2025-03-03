import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_jmot/blocs/auth/auth_bloc.dart';
import 'package:prueba_tecnica_jmot/blocs/auth/auth_event.dart';
import 'package:prueba_tecnica_jmot/blocs/auth/auth_state.dart';
import 'package:prueba_tecnica_jmot/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login(BuildContext context) {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(emailController.text, passwordController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthenticated) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
                TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Contraseña'), obscureText: true),
                SizedBox(height: 20),
                if (state is AuthLoading) CircularProgressIndicator(),
                if (state is! AuthLoading)
                  ElevatedButton(onPressed: () => login(context), child: Text('Iniciar Sesión')),
              ],
            ),
          );
        },
      ),
    );
  }
}