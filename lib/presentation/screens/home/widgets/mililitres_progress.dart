import 'dart:math';

import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/goal/goal_cubit.dart';
import 'package:drink_tracker/logic/helpers/date_helper.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MililitresProgress extends StatelessWidget {
  const MililitresProgress({required this.data, super.key});

  final DiaryData data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<DiaryCubit, DiaryState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.totalAmount.toString(),
                style: AppTextStyle.h1White,
              ),
              Text(
                'Goal: ${state.goal} ml',
                style: AppTextStyle.h3,
              ),
              Text(
                '${max(state.goal - data.totalAmount, 0)} ml left',
                style: AppTextStyle.h3,
              ),
            ],
          );
        },
      ),
    );
  }
}
