import 'package:drink_tracker/logic/cubits/bottom_card/bottom_card_cubit.dart';
import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/helpers/date_helper.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/drawer/app_drawer.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/bottom_card.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/add_button.dart';
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
          create: (_) => BottomCardCubit(),
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
  final double _appBarHeight = 70;
  final double _bottomCardTopPartHeight = 70;

  void _onPageChanged(int page) {
    var newPageDate = DateHelper.getDateFromPage(page);
    context.read<PageDateCubit>().pageChanging(
          newPageDate: newPageDate,
        );
  }

  void _openBottomCard() {
    context.read<BottomCardCubit>().openBottomCard();
  }

  void _closeBottomCard() {
    context.read<BottomCardCubit>().closeBottomCard();
  }

  void _onBottomCardTap(BottomCardState state) {
    if (state.status == BottomCardStatus.open) {
      _closeBottomCard();
    } else {
      _openBottomCard();
    }
  }

  void _onPanEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 500) {
      _closeBottomCard();
    }
    if (details.velocity.pixelsPerSecond.dy < -500) {
      _openBottomCard();
    }
  }

  double get _topViewPadding {
    return MediaQuery.of(context).viewPadding.top;
  }

  double get _bottomCardWidth {
    return MediaQuery.of(context).size.width;
  }

  double get _bottomCardHeight {
    return MediaQuery.of(context).size.height - _appBarHeight - _topViewPadding;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawerEnableOpenDragGesture: false,
      backgroundColor: AppColors.backgroundColor,
      drawer: const AppDrawer(),
      appBar: TransparentAppBar(height: _appBarHeight),
      body: GestureDetector(
        onPanEnd: _onPanEnd,
        child: Builder(
          builder: (context) {
            final diaryState = context.watch<DiaryCubit>().state;
            final bottomCardState = context.watch<BottomCardCubit>().state;
            return PageView.builder(
              physics: bottomCardState.status == BottomCardStatus.open
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
              reverse: true,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, page) {
                final pageDate = DateHelper.getDateFromPage(page);
                final diaryData = diaryState.getDiaryData(pageDate);
                return Stack(
                  children: [
                    Column(
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
                        SizedBox(
                          height: _bottomCardTopPartHeight,
                        ),
                      ],
                    ),
                    AnimatedPositioned(
                      curve: Curves.easeOut,
                      duration: const Duration(milliseconds: 300),
                      bottom: bottomCardState.status == BottomCardStatus.close
                          ? -_bottomCardHeight + _bottomCardTopPartHeight
                          : 0,
                      child: GestureDetector(
                        onTap: () => _onBottomCardTap(bottomCardState),
                        child: BottomCard(
                          data: diaryData,
                          width: _bottomCardWidth,
                          height: _bottomCardHeight,
                          topPartHeight: _bottomCardTopPartHeight,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
