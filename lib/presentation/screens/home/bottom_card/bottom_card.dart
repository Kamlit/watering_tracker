import 'package:drink_tracker/logic/cubits/bottom_card/bottom_card_cubit.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/details_page.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/history_page.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomCard extends StatefulWidget {
  const BottomCard({
    required this.data,
    required this.width,
    required this.height,
    required this.topPartHeight,
    super.key,
  });

  final DiaryData data;
  final double width;
  final double height;
  final double topPartHeight;

  @override
  State<BottomCard> createState() => _BottomCardState();
}

class _BottomCardState extends State<BottomCard> {
  final PageController _pageController = PageController(initialPage: 1000);

  void _onPageChanged(int page) {
    var newPage =
        page.isEven ? BottomCardPage.details : BottomCardPage.history;
    context.read<BottomCardCubit>().changePage(newPage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: widget.topPartHeight,
            child: BlocBuilder<BottomCardCubit, BottomCardState>(
              builder: (context, state) {
                if (state.status == BottomCardStatus.open) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_left,
                        color: AppColors.white,
                      ),
                      BlocBuilder<BottomCardCubit, BottomCardState>(
                        builder: (context, state) {
                          return Text(
                            state.page == BottomCardPage.details
                                ? 'Details'
                                : 'History',
                            style: AppTextStyle.h2,
                          );
                        },
                      ),
                      const Icon(
                        Icons.arrow_right,
                        color: AppColors.white,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_drop_up,
                        color: AppColors.white,
                      ),
                      BlocBuilder<BottomCardCubit, BottomCardState>(
                        builder: (context, state) {
                          return Text(
                            state.page == BottomCardPage.details
                                ? 'Details'
                                : 'History',
                            style: AppTextStyle.h2,
                          );
                        },
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) => index.isEven
                  ? DetailsPage(data: widget.data)
                  : HistoryPage(data: widget.data),
            ),
          ),
          SizedBox(
            height: widget.topPartHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Hide',
                  style: AppTextStyle.h3,
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.greyLight,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
