import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
          children: [
            ...data.entries.map(
              (entry) => Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  final date = context.read<PageDateCubit>().state.pageDate;
                  context.read<DiaryCubit>().deleteEntry(date, entry);
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.delete_outline,
                      color: AppColors.white,
                    ),
                  ),
                ),
                key: ValueKey(entry),
                child: ListTile(
                  title: Text(
                    DateFormat('MMM d, y H:mm').format(entry.date),
                    style: AppTextStyle.h3,
                  ),
                  subtitle: Row(
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
                      const Spacer(),
                      Text(
                        '${entry.amount.toString()} ml',
                        style: AppTextStyle.h3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Text(
              'Swipe left to delete',
              style: AppTextStyle.h3.copyWith(color: AppColors.greyDark),
            ),
          ],
        ),
      ),
    );
  }
}
