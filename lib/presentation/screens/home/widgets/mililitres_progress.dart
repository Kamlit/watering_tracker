import 'package:drink_tracker/logic/blocs/diary/diary_bloc.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MililitresProgress extends StatelessWidget {
  const MililitresProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiaryBloc, DiaryState>(
      builder: (context, state) {
        if (state is DiaryLoaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.totalAmount.toString(),
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
        }
        return Container();
      },
    );
  }
}
