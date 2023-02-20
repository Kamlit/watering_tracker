import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/details_cubit.dart/details_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/goal/goal_cubit.dart';
import 'package:drink_tracker/logic/helpers/date_helper.dart';
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
          create: (_) => PageDateCubit(),
        ),
        BlocProvider(
          create: (_) => DetailsCubit(),
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
    context.read<PageDateCubit>().pageChanged(
          newPageDate: newPageDate,
        );
  }

  void _openDetails() {
    context.read<DetailsCubit>().openDetails();
  }

  void _hideDetails() {
    context.read<DetailsCubit>().hideDetails();
  }

  void _onDetailsTap(DetailsState state) {
    if (state == DetailsOpen()) {
      _hideDetails();
    } else {
      _openDetails();
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 500) {
      _hideDetails();
    }
    if (details.velocity.pixelsPerSecond.dy < -500) {
      _openDetails();
    }
  }

  final double _appDrawerHeight = 70;

  double get _detailsHeight {
    return MediaQuery.of(context).size.height -
        _appDrawerHeight -
        MediaQuery.of(context).viewPadding.top;
  }

  double get _detailsWidth {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      backgroundColor: AppColors.backgroundColor,
      drawer: const AppDrawer(),
      appBar: TransparentAppBar(height: _appDrawerHeight),
      body: GestureDetector(
        onPanEnd: _onPanEnd,
        child: Stack(
          children: [
            PageView.builder(
              reverse: true,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, page) {
                final pageDate = DateHelper.getDateFromPage(page);
                final diaryData =
                    context.watch<DiaryCubit>().state.getDiaryData(pageDate);
                return Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: MililitresProgress(
                        data: diaryData,
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
                        data: diaryData,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                  ],
                );
              },
            ),
            BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                return AnimatedPositioned(
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                  bottom: state == DetailsOpen()
                      ? 0
                      : -_detailsHeight + _appDrawerHeight,
                  child: GestureDetector(
                    onTap: () => _onDetailsTap(state),
                    child: DetailsBottomContainer(
                      height: _detailsHeight,
                      width: _detailsWidth,
                      topPartHeight: _appDrawerHeight,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
