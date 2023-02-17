import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/goal/goal_cubit.dart';
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
import 'package:drink_tracker/logic/helpers/date_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => DiaryCubit(),
        ),
        BlocProvider(
          create: (_) => PageDateCubit(),
        ),
        BlocProvider(
          create: (_) => GoalCubit(),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void _onPageChanged(int page) {
    var newPageDate = DateHelper.getDateFromPage(page);
    context.read<PageDateCubit>().onPageChanged(
          newPageDate: newPageDate,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      backgroundColor: AppColors.backgroundColor,
      drawer: const AppDrawer(),
      appBar: const TransparentAppBar(
        height: 80,
      ),
      body: PageView.builder(
        reverse: true,
        onPageChanged: _onPageChanged,
        itemBuilder: (context, page) {
          final pageDate = DateHelper.getDateFromPage(page);
          return Column(
            children: [
              Expanded(
                flex: 6,
                child: MililitresProgress(
                  pageDate: pageDate,
                ),
              ),
              const Expanded(
                flex: 3,
                child: AddButton(),
              ),
              Expanded(
                flex: 3,
                child: SemiCircularProgressBar(
                  size: 32,
                  pageDate: pageDate,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const DetailsBottomContainer(),
            ],
          );
        },
      ),
    );
  }
}
