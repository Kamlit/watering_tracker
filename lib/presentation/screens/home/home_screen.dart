import 'package:drink_tracker/logic/cubits/bottom_card/bottom_card_cubit.dart';
import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/helpers/date_helper.dart';
import 'package:drink_tracker/presentation/drawer/app_drawer.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/bottom_card.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/add_button.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/mililitres_progress.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/semi_circular_progress_bar.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/transparent_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
  final PanelController _panelController = PanelController();
  final PageController _pageController = PageController();
  final double _appBarHeight = 80;
  final double _bottomCardTopPartHeight = 80;

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _jumpToPage(DateTime date) {
    _pageController.jumpToPage(
      DateTime.now().difference(date).inDays,
    );
  }

  void _onPageChanged(int page) {
    var newPageDate = DateHelper.getDateFromPage(page);
    context.read<PageDateCubit>().pageChanged(
          newPageDate: newPageDate,
        );
  }

  void _openBottomCard() {
    if (_panelController.isPanelClosed) {
      _panelController.open();
    }
  }

  void _closeBottomCard() {
    if (_panelController.isPanelOpen) {
      _panelController.close();
    }
  }

  void _onBottomCardTap(BottomCardState state) {
    if (_panelController.panelPosition.round() == 1) {
      _panelController.close();
    } else {
      _panelController.open();
    }
  }

  void _onPanEnd(DragEndDetails details) {
    var isSwipingHorizontal = details.velocity.pixelsPerSecond.dx.abs() >
        details.velocity.pixelsPerSecond.dy.abs();
    var swipingSensitivity = 500;
    if (isSwipingHorizontal) {
      var velocity = details.velocity.pixelsPerSecond.dx;
      if (velocity > swipingSensitivity) {
        _nextPage();
      } else if (velocity < -swipingSensitivity) {
        _previousPage();
      }
    } else {
      var velocity = details.velocity.pixelsPerSecond.dy;
      if (velocity > swipingSensitivity) {
        _closeBottomCard();
      } else if (velocity < -swipingSensitivity) {
        _openBottomCard();
      }
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
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              reverse: true,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, page) {
                final pageDate = DateHelper.getDateFromPage(page);
                final diaryData = diaryState.getDiaryData(pageDate);
                return BlocListener<PageDateCubit, PageDateState>(
                  listener: (context, state) {
                    if (state.status == PageDateStatus.jumpRequested) {
                      _jumpToPage(state.pageDate);
                    }
                  },
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: () => _onBottomCardTap(bottomCardState),
                        child: SlidingUpPanel(
                          controller: _panelController,
                          minHeight: _bottomCardTopPartHeight,
                          maxHeight: _bottomCardHeight,
                          renderPanelSheet: false,
                          body: Column(
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
                                height: _bottomCardTopPartHeight +
                                    _appBarHeight +
                                    40,
                              ),
                            ],
                          ),
                          parallaxEnabled: true,
                          parallaxOffset: 0.5,
                          panelBuilder: (controller) {
                            return BottomCard(
                              scrollController: controller,
                              data: diaryData,
                              width: _bottomCardWidth,
                              height: _bottomCardHeight,
                              topPartHeight: _bottomCardTopPartHeight,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
