import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/details_cubit.dart/details_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/presentation/screens/home/details_bottom_container/details_page.dart';
import 'package:drink_tracker/presentation/screens/home/details_bottom_container/history_page.dart';
import 'package:drink_tracker/presentation/screens/home/details_bottom_container/percentage_bar_tile.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/percentage_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBottomContainer extends StatefulWidget {
  const DetailsBottomContainer({
    required this.width,
    required this.height,
    required this.topPartHeight,
    super.key,
  });

  final double width;
  final double height;
  final double topPartHeight;

  @override
  State<DetailsBottomContainer> createState() => _DetailsBottomContainerState();
}

class _DetailsBottomContainerState extends State<DetailsBottomContainer> {
  final PageController _pageController = PageController(initialPage: 1000);

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
            child: BlocBuilder<DetailsCubit, DetailsState>(
              builder: (context, state) {
                if (state == DetailsOpen()) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.arrow_left,
                        color: AppColors.white,
                      ),
                      Text(
                        'Details',
                        style: AppTextStyle.h2,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: AppColors.white,
                      ),
                    ],
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.arrow_drop_up,
                        color: AppColors.white,
                      ),
                      Text(
                        'Details',
                        style: AppTextStyle.h2,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          BlocBuilder<PageDateCubit, PageDateState>(
            builder: (context, state) {
              if (state.status == PageDateStatus.changed) {
                final pageDate = state.pageDate;
                final diaryData =
                    context.watch<DiaryCubit>().state.getDiaryData(pageDate);
                return Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemBuilder: (context, index) => index.isEven
                        ? DetailsPage(data: diaryData)
                        : HistoryPage(data: diaryData),
                  ),
                );
              } else {
                return const Spacer();
              }
            },
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
