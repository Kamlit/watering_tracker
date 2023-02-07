import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/blocs/diary/diary_bloc.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  void _addEntry(BuildContext context) {
    final now = DateTime.now();
    BlocProvider.of<DiaryBloc>(context).add(
      AddEntryRequested(
        date: DateTime(now.year, now.month, now.day),
        entry: DiaryEntry(
          drinkType:
              drinkTypes.firstWhere((element) => element.name == 'water'),
          mililitres: 250,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => _addEntry(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.greyDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
            minimumSize: const Size(60, 60),
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
