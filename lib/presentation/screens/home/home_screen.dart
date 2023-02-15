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
          create: (_) => DayPageCubit(),
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
  void _onPageChanged(int value) {
    var newPageDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(
      Duration(days: -value),
    );
    var entries =
        context.read<DiaryCubit>().getDiaryEntriesFromDate(newPageDate);
    context.read<DayPageCubit>().onPageChanged(
          newPageDate: newPageDate,
          entries: entries,
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
      body: BlocBuilder<DiaryCubit, DiaryState>(
        builder: (context, state) {
          return PageView.builder(
            reverse: true,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: MililitresProgress(
                      page: index,
                    ),
                  ),
                  const Expanded(
                    flex: 3,
                    child: AddButton(),
                  ),
                  const Expanded(
                    flex: 3,
                    child: SemiCircularProgressBar(
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const DetailsBottomContainer(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
