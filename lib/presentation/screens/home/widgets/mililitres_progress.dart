import 'dart:math';

import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/goal/goal_cubit.dart';
import 'package:drink_tracker/logic/helpers/date_helper.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MililitresProgress extends StatelessWidget {
  const MililitresProgress({required this.pageDate, super.key});

  final DateTime pageDate;

  @override
  Widget build(BuildContext context) {
    final diaryCubit = context.watch<DiaryCubit>();
    final goalCubit = context.watch<GoalCubit>();
    final totalAmount = diaryCubit.state.getTotalAmountFromDate(pageDate);
    final goal = goalCubit.state;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            totalAmount.toString(),
            style: AppTextStyle.h1White,
          ),
          Text(
            'Goal: $goal ml',
            style: AppTextStyle.h3,
          ),
          Text(
            '${max(goal - totalAmount, 0)} ml left',
            style: AppTextStyle.h3,
          ),
        ],
      ),
    );
  }
}
