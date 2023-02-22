import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/details_cubit.dart/details_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/presentation/screens/home/details_bottom_container/percentage_bar_tile.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/percentage_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsBottomContainer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: topPartHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Details',
                  style: AppTextStyle.h2,
                ),
              ],
            ),
          ),
          BlocBuilder<PageDateCubit, PageDateState>(
            builder: (context, state) {
              final pageDate = state.pageDate;
              final diaryData =
                  context.watch<DiaryCubit>().state.getDiaryData(pageDate);
              return Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: List.generate(
                        diaryData.drinkTypesColors.length,
                        (index) {
                          return PercentageBarTile(
                            title: diaryData.drinkTypesTotalAmount.keys
                                .elementAt(index),
                            amount: diaryData.drinkTypesTotalAmount.values
                                .elementAt(index),
                            percentage: diaryData.drinkTypesFractions[index],
                            color: diaryData.drinkTypesColors[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: topPartHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
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
