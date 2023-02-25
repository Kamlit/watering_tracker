import 'package:drink_tracker/logic/blocs/authentication/authentication_observer.dart';
import 'package:drink_tracker/presentation/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // await HydratedBloc.storage.clear();
  Paint.enableDithering = true;
  Bloc.observer = AuthenticationObserver();
  
  runApp(const App());
}
