import 'package:drink_tracker/logic/cubits/day_page/day_page_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MililitresProgress extends StatelessWidget {
  const MililitresProgress({required this.page, super.key});

  final int page;

  @override
  Widget build(BuildContext context) {
    final pageDate = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(
      Duration(days: -page),
    );
    final totalAmount =
        context.read<DiaryCubit>().getTotalAmountFromDate(pageDate);
        
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            totalAmount.toString(),
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
}
