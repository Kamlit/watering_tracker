import 'dart:math';

import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/goal/goal_cubit.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/semi_circle_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';

class SemiCircularProgressBar extends StatelessWidget {
  const SemiCircularProgressBar({
    super.key,
    required this.size,
    required this.pageDate,
  });

  final double size;
  final DateTime pageDate;

  @override
  Widget build(BuildContext context) {
    final diaryCubit = context.watch<DiaryCubit>();
    final goalCubit = context.watch<GoalCubit>();
    final totalAmount = diaryCubit.state.getTotalAmountFromDate(pageDate);
    final map = diaryCubit.state.getDrinkTypesTotalAmount(pageDate);
    List<double> fractions = [];
    if (map != null) {
      map.entries.forEach((element) {
        fractions.add(element.value / max(goalCubit.state, totalAmount));
      });
    }
    List<Color> drinkTypesColors = [];
    if (map != null) {
      for (var name in map.keys) {
        for (var drinkType in drinkTypes) {
          if (name == drinkType.name) {
            drinkTypesColors.add(drinkType.color.toColor());
          }
        }
      }
    }
    final percentageProgress =
        min(((totalAmount / goalCubit.state) * 100).round(), 100);
    print((totalAmount / goalCubit.state).round());
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: CustomPaint(
            size: Size(size * 10, size / 2 * 10),
            painter: SemiCirclePainter(
              backgroundColor: AppColors.greyDark,
              progressBarColors: drinkTypesColors,
              progressBarFractions: fractions,
              barWidth: 20,
            ),
          ),
        ),
        Positioned.fill(
          top: 50,
          child: Center(
            child: Text(
              '$percentageProgress%',
              style: AppTextStyle.h1Grey,
            ),
          ),
        )
      ],
    );
  }
}
