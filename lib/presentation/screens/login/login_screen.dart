import 'package:drink_tracker/logic/blocs/authentication_bloc.dart';
import 'package:drink_tracker/logic/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _signIn(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      SignInRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 36, 36, 36),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signIn(context),
          child: const Text('Sign Up with Google'),
        ),
      ),
    );
  }
}
