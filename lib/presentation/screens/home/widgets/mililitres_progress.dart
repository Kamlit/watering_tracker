import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MililitresProgress extends StatelessWidget {
  const MililitresProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryCubit, DiaryState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.diary!.isNotEmpty
                    ? state.diary!.entries.first.value.first.amount.toString()
                    : '',
                style: AppTextStyle.h1White,
              ),
              Text(
                'Goal: 2000 ml',
                style: AppTextStyle.h3,
              ),
              Text(
                '800 ml left',
                style: AppTextStyle.h3,
              ),
            ],
          ),
        );
      },
    );
  }
}
