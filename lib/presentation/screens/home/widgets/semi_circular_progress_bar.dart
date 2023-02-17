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

  List<double> _getDrinkTypesFractions({
    required Map<String, int>? map,
    required int goal,
    required int totalAmount,
  }) {
    var fractions = <double>[];
    if (map != null) {
      for (var element in map.entries) {
        fractions.add(element.value / max(goal, totalAmount));
      }
    }
    return fractions;
  }

  List<Color> _getDrinkTypesColors({
    required Map<String, int>? map,
  }) {
    var colors = <Color>[];
    if (map != null) {
      for (var name in map.keys) {
        for (var drinkType in drinkTypes) {
          if (name == drinkType.name) {
            colors.add(drinkType.color.toColor());
          }
        }
      }
    }
    return colors;
  }

  @override
  Widget build(BuildContext context) {
    final diaryCubit = context.watch<DiaryCubit>();
    final goalCubit = context.watch<GoalCubit>();

    final totalAmount = diaryCubit.state.getTotalAmountFromDate(pageDate);
    final drinkTypesTotalAmount =
        diaryCubit.state.getDrinkTypesTotalAmount(pageDate);
    final drinkTypesFractions = _getDrinkTypesFractions(
      map: drinkTypesTotalAmount,
      goal: goalCubit.state,
      totalAmount: totalAmount,
    );
    final drinkTypesColors = _getDrinkTypesColors(
      map: drinkTypesTotalAmount,
    );
    final percentageProgress = ((totalAmount / goalCubit.state) * 100).round();

    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: CustomPaint(
            size: Size(size * 10, size / 2 * 10),
            painter: SemiCirclePainter(
              backgroundColor: AppColors.greyDark,
              progressBarColors: drinkTypesColors,
              progressBarFractions: drinkTypesFractions,
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
