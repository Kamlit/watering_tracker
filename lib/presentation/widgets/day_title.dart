import 'package:drink_tracker/logic/cubits/day_page/day_page_cubit.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DayTitle extends StatelessWidget {
  const DayTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
        const Icon(Icons.arrow_left),
        BlocBuilder<DayPageCubit, DayPageState>(
          builder: (context, state) {
            return Text(
              state.pageDate.toString(),
              style: AppTextStyle.h2,
            );
          },
        ),
        const Icon(Icons.arrow_right),
      ],
    );
  }
}
