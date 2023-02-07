import 'package:drink_tracker/logic/blocs/authentication/authentication_bloc.dart';
import 'package:drink_tracker/logic/repositories/authorization_repository.dart';
import 'package:drink_tracker/logic/routes.dart';
import 'package:drink_tracker/presentation/screens/home/home_screen.dart';
import 'package:drink_tracker/presentation/screens/loading/loading_screen.dart';
import 'package:drink_tracker/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthorizationRepository(),
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
          authorizationRepository:
              RepositoryProvider.of<AuthorizationRepository>(context),
        )..add(
            AppStarted(),
          ),
        child: MaterialApp(
          title: 'Drinking Tracker',
          home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return const HomeScreen();
              } else if (state is Unauthenticated) {
                return const LoginScreen();
              } else if (state is AuthenticationError) {
                return const Center(child: Text('Error'));
              }
              return const LoadingScreen();
            },
          ),
          routes: Routes.routes,
        ),
      ),
    );
  }
}
