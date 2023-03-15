import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/page/page_cubit.dart';
import 'package:drink_tracker/logic/helpers/date_helper.dart';
import 'package:drink_tracker/presentation/drawer/app_drawer.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/bottom_card.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/home_body.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/home_app_bar.dart';
import 'package:drink_tracker/presentation/style.dart';
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
          create: (_) => PageCubit(),
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
    context.read<PageCubit>().pageChanged(
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

  void _onBottomCardTap() {
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
      var isPageChanging =
          _pageController.page!.roundToDouble() != _pageController.page;
      if (!isPageChanging) {
        var velocity = details.velocity.pixelsPerSecond.dx;
        if (velocity > swipingSensitivity) {
          _nextPage();
        } else if (velocity < -swipingSensitivity) {
          _previousPage();
        }
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
      appBar: HomeAppBar(height: _appBarHeight),
      body: GestureDetector(
        onPanEnd: _onPanEnd,
        child: BlocBuilder<DiaryCubit, DiaryState>(
          builder: (context, diaryState) {
            return PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              reverse: true,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, page) {
                final pageDate = DateHelper.getDateFromPage(page);
                final diaryData = diaryState.getDiaryData(pageDate);
                return BlocListener<PageCubit, PageState>(
                  listener: (context, state) {
                    if (state.status == PageStatus.jumpRequested) {
                      _jumpToPage(state.pageDate);
                    }
                  },
                  child: GestureDetector(
                    onTap: _onBottomCardTap,
                    child: SlidingUpPanel(
                      controller: _panelController,
                      minHeight: _bottomCardTopPartHeight,
                      maxHeight: _bottomCardHeight,
                      renderPanelSheet: false,
                      body: Padding(
                        padding: EdgeInsets.only(
                          bottom: _bottomCardTopPartHeight * 2 + 30,
                        ),
                        child: HomeBody(
                          diaryData: diaryData,
                        ),
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
