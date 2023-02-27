import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/details_window.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/semi_circle_painter.dart';
import 'package:flutter/material.dart';

class SemiCircularProgressBar extends StatelessWidget {
  const SemiCircularProgressBar({
    super.key,
    required this.size,
    required this.data,
  });

  final double size;
  final DiaryData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.backgroundColor,
            content: DetailsWindow(data: data),
          );
        },
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: CustomPaint(
              size: Size(size * 10, size / 2 * 10),
              painter: SemiCirclePainter(
                backgroundColor: AppColors.greyDark,
                progressBarColors: data.drinkTypesColors,
                progressBarFractions: data.drinkTypesFractions,
                barWidth: 20,
              ),
            ),
          ),
          Positioned.fill(
            top: 50,
            child: Center(
              child: Text(
                '${data.goalPercentage}%',
                style: AppTextStyle.h1Grey,
              ),
            ),
          )
        ],
      ),
    );
  }
}
