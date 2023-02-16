import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/add_entry_modal_bottom_sheet.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      context: context,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: BlocProvider.of<DiaryCubit>(context),
            ),
            BlocProvider.value(
              value: BlocProvider.of<PageDateCubit>(context),
            ),
          ],
          child: const AddEntryModalBottomSheet(),
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
