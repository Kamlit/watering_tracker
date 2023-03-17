import 'package:drink_tracker/logic/blocs/authentication/authentication_bloc.dart';
import 'package:drink_tracker/logic/repositories/authorization_repository.dart';
import 'package:drink_tracker/presentation/routing/router.dart';
import 'package:drink_tracker/presentation/routing/routes.dart';
import 'package:drink_tracker/presentation/screens/home/home_screen.dart';
import 'package:drink_tracker/presentation/screens/loading/loading_screen.dart';
import 'package:drink_tracker/presentation/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _appRouter = AppRouter();

  @override
  void dispose() {
    _appRouter.dipose();
    super.dispose();
  }

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
          theme: ThemeData(
            fontFamily: 'Nunito',
          ),
          title: 'Drinking Tracker',
          onGenerateRoute: _appRouter.onGenerateRoute,
        ),
      ),
    );
  }
}
