import 'package:drink_tracker/logic/blocs/authentication/authentication_observer.dart';
import 'package:drink_tracker/presentation/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Paint.enableDithering = true;
  Bloc.observer = AuthenticationObserver();
  runApp(const App());
}
