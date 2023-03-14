import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/cubits/page/page_cubit.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class EntryTile extends StatelessWidget {
  const EntryTile({
    super.key,
    required this.entry,
  });

  final DiaryEntry entry;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        final date = context.read<PageCubit>().state.pageDate;
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
              style: AppTextStyle.h2,
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
              style: AppTextStyle.h2,
            ),
          ],
        ),
      ),
    );
  }
}
