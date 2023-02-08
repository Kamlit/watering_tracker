import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/blocs/diary/diary_bloc.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/add_entry_modal_bottom_sheet.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  void _showModalBottomSheet(BuildContext context) {
    DiaryEntry? newEntry;

    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: BlocProvider.of<DiaryBloc>(context),
          child: AddEntryModalBottomSheet(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => _showModalBottomSheet(context),
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
