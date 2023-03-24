import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/page/page_cubit.dart';
import 'package:drink_tracker/logic/cubits/saved_values/saved_values_cubit.dart';
import 'package:drink_tracker/presentation/routing/routes.dart';
import 'package:drink_tracker/presentation/screens/home/home_screen.dart';
import 'package:drink_tracker/presentation/screens/login/login_screen.dart';
import 'package:drink_tracker/presentation/widgets/new_drink_type_window.dart';
import 'package:drink_tracker/presentation/screens/saved_values/saved_values_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final DiaryCubit _diaryCubit = DiaryCubit();
  final PageCubit _pageCubit = PageCubit();
  final SavedValuesCubit _savedValuesCubit = SavedValuesCubit();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _diaryCubit,
              ),
              BlocProvider.value(
                value: _pageCubit,
              ),
              BlocProvider.value(
                value: _savedValuesCubit,
              ),
            ],
            child: const HomeScreen(),
          ),
        );
      // case '/login':
      //   return MaterialPageRoute(
      //     builder: (_) => const LoginScreen(),
      //   );
      case Routes.savedValuesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _savedValuesCubit,
            child: const SavedValuesScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: _diaryCubit,
              ),
              BlocProvider.value(
                value: _pageCubit,
              ),
              BlocProvider.value(
                value: _savedValuesCubit,
              ),
            ],
            child: const HomeScreen(),
          ),
        );
    }
  }

  void dipose() {
    _diaryCubit.close();
    _pageCubit.close();
    _savedValuesCubit.close();
  }
}
