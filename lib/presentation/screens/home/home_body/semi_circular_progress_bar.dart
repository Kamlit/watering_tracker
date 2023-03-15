import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/home_body/details_window.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/semi_circle_painter.dart';
import 'package:flutter/material.dart';

class SemiCircularProgressBar extends StatelessWidget {
  const SemiCircularProgressBar({
    super.key,
    required this.padding,
    required this.data,
  });

  final double padding;
  final DiaryData data;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => showDialog<void>(
        context: context,
        builder: (context) {
          return DetailsWindow(data: data);
        },
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomPaint(
            size: Size(
              width - padding * 2,
              width / 2 - padding,
            ),
            painter: SemiCirclePainter(
              backgroundColor: AppColors.greyDark,
              progressBarColors: data.drinkTypesColors,
              progressBarFractions: data.drinkTypesFractions,
              barWidth: 20,
            ),
          ),
          Positioned(
            bottom: 20,
            child: Text(
              '${data.goalPercentage}%',
              style: AppTextStyle.h1Grey,
            ),
          )
        ],
      ),
    );
  }
}
