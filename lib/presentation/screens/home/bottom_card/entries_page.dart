import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/bottom_card/entry_tile.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class EntriesPage extends StatelessWidget {
  const EntriesPage({
    super.key,
    required this.scrollController,
    required this.data,
  });

  final ScrollController scrollController;
  final DiaryData data;

  @override
  Widget build(BuildContext context) {
    final isEmpty = data.entries.isEmpty;
    return isEmpty ? _buildEmptyEntriesPage() : _buildEntriesPage();
  }

  Widget _buildEntriesPage() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  ...data.entries.map(
                    (entry) => EntryTile(entry: entry),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Swipe left to delete entry',
            style: AppTextStyle.h3.copyWith(color: AppColors.greyDark),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyEntriesPage() {
    return const Center(
      child: Text(
        "There's nothing here :(",
        style: AppTextStyle.h3dark,
      ),
    );
  }
}
