import 'package:drink_tracker/logic/cubits/day_page/day_page_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/repositories/diary_repository.dart';
import 'package:drink_tracker/presentation/drawer/app_drawer.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/add_button.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/details_bottom_container.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/mililitres_progress.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/semi_circular_progress_bar.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/transparent_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _initialPage = 1000;
  final _pageController = PageController(
    initialPage: _initialPage,
  );
  int _currentPage = _initialPage;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DiaryRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DayPageCubit(),
          ),
          BlocProvider(
            create: (context) => DiaryCubit(),
          )
        ],
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          drawerEnableOpenDragGesture: false,
          backgroundColor: AppColors.backgroundColor,
          drawer: const AppDrawer(),
          appBar: const TransparentAppBar(
            height: 80,
          ),
          body: PageView.builder(
            controller: _pageController,
            onPageChanged: (value) {
              
            },
            itemBuilder: (context, index) {
              return Column(
                children: const [
                  Expanded(
                    flex: 6,
                    child: MililitresProgress(),
                  ),
                  Expanded(
                    flex: 3,
                    child: AddButton(),
                  ),
                  Expanded(
                    flex: 3,
                    child: SemiCircularProgressBar(
                      size: 32,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DetailsBottomContainer(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
