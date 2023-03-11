import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/entries_page.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class BottomCard extends StatelessWidget {
  const BottomCard({
    required this.scrollController,
    required this.data,
    required this.width,
    required this.height,
    required this.topPartHeight,
    super.key,
  });

  final ScrollController scrollController;
  final DiaryData data;
  final double width;
  final double height;
  final double topPartHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {},
      child: Container(
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
              child: Column(
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
              ),
            ),
            Expanded(
              child: EntriesPage(
                data: data,
                scrollController: scrollController,
              ),
            ),
            // SizedBox(
            //   height: topPartHeight,
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: const [
            //       Text(
            //         'Hide',
            //         style: AppTextStyle.h3,
            //       ),
            //       Icon(
            //         Icons.arrow_drop_down,
            //         color: AppColors.greyLight,
            //       )
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
