import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/details_cubit.dart/details_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/helpers/date_helper.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/drawer/app_drawer.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/add_button.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/bottom_card.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/mililitres_progress.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/semi_circular_progress_bar.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/percentage_bar.dart';
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
  final double _appBarHeight = 70;
  final double _detailsTopPartHeight = 70;

  final PageController _pageController = PageController();

  @override
  void initState() {
    _pageController.addListener(() {
      print(_pageController.page);
      if (_pageController.page!.round() == _pageController.page) {
        context.read<PageDateCubit>().pageChanged();
      }
    });
    super.initState();
  }

  void _onPageChanged(int page) {
    var newPageDate = DateHelper.getDateFromPage(page);
    context.read<PageDateCubit>().pageChanging(
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

  double get _topViewPadding {
    return MediaQuery.of(context).viewPadding.top;
  }

  double get _detailsWidth {
    return MediaQuery.of(context).size.width;
  }

  double get _detailsHeight {
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
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
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
                    SizedBox(
                      height: _detailsTopPartHeight,
                    ),
                  ],
                );
              },
            ),
            // SizedBox(
            //   height: 70,
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: InkWell(
            //           child: Container(
            //             margin: EdgeInsets.all(4),
            //             decoration: const BoxDecoration(
            //               color: AppColors.dark,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(25),
            //               ),
            //             ),
            //             child: Center(
            //               child: const Text(
            //                 'Details',
            //                 style: AppTextStyle.h2,
            //               ),
            //             ),
            //           ),
            //           onTap: () {
            //             _openDetails();
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: InkWell(
            //           child: Container(
            //             margin: EdgeInsets.all(4),
            //             decoration: const BoxDecoration(
            //               color: AppColors.dark,
            //               borderRadius: BorderRadius.all(
            //                 Radius.circular(25),
            //               ),
            //             ),
            //             child: Center(
            //               child: const Text(
            //                 'History',
            //                 style: AppTextStyle.h2,
            //               ),
            //             ),
            //           ),
            //           onTap: () {},
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                return AnimatedPositioned(
                  curve: Curves.easeOut,
                  duration: const Duration(milliseconds: 300),
                  bottom: state == DetailsOpen()
                      ? 0
                      : -_detailsHeight + _detailsTopPartHeight,
                  child: GestureDetector(
                    onTap: () => _onDetailsTap(state),
                    child: BottomCard(
                      width: _detailsWidth,
                      height: _detailsHeight,
                      topPartHeight: _detailsTopPartHeight,
                    ),
                  ),
                );
              },
            ),
            // BlocBuilder<DetailsCubit, DetailsState>(
            //   builder: (context, state) {
            //     return AnimatedPositioned(
            //       curve: Curves.easeOut,
            //       duration: const Duration(milliseconds: 300),
            //       bottom: state == DetailsOpen() ? 0 : -_detailsHeight,
            //       child: GestureDetector(
            //         onTap: () => _onDetailsTap(state),
            //         child: DetailsBottomContainer(
            //           width: _detailsWidth,
            //           height: _detailsHeight,
            //           topPartHeight: _detailsTopPartHeight,
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
