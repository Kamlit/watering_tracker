import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EntriesPage extends StatelessWidget {
  const EntriesPage({
    super.key,
    required this.data,
  });

  final DiaryData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: data.entries
              .map(
                (entry) => ListTile(
                  title: Row(
                    children: [
                      Text(
                        entry.drinkType.name,
                        style: AppTextStyle.h3,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          Icons.circle,
                          size: 9,
                          color: entry.drinkType.color.toColor(),
                        ),
                      ),
                      Text(
                        '${entry.amount.toString()} ml',
                        style: AppTextStyle.h3,
                      ),
                    ],
                  ),
                  trailing:  IconButton(
                    onPressed: () {
                      final date = context.read<PageDateCubit>().state.pageDate;
                      context.read<DiaryCubit>().deleteEntry(date, entry);
                    },
                    icon: const Icon(Icons.close),
                    color: AppColors.greyLight,
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
