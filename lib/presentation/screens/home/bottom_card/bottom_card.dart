import 'package:drink_tracker/logic/cubits/bottom_card/bottom_card_cubit.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/entries_page.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomCard extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: AppBorderRadius.onlyTop,
      ),
      child: Column(
        children: [
          SizedBox(
            height: topPartHeight,
            child: BlocBuilder<BottomCardCubit, BottomCardState>(
              builder: (context, state) {
                if (state.status == BottomCardStatus.open) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Entries',
                        style: AppTextStyle.h2,
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
                        'Entries',
                        style: AppTextStyle.h2,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          Expanded(
            child: EntriesPage(data: data),
          ),
          SizedBox(
            height: topPartHeight,
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
