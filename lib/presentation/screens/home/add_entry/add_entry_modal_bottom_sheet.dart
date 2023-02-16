import 'package:drink_tracker/logic/cubits/day_page/page_date_cubit.dart';
import 'package:drink_tracker/logic/cubits/diary/diary_cubit.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/logic/models/drink_type.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/select_amount_page.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/select_drink_type_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEntryModalBottomSheet extends StatefulWidget {
  const AddEntryModalBottomSheet({super.key});

  @override
  State<AddEntryModalBottomSheet> createState() =>
      _AddEntryModalBottomSheetState();
}

class _AddEntryModalBottomSheetState extends State<AddEntryModalBottomSheet> {
  final PageController _pageController = PageController();

  late DrinkType _drinkType;
  late int _amount;

  void _addEntry(BuildContext context) {
    BlocProvider.of<DiaryCubit>(context).addEntry(
      context.read<PageDateCubit>().state.pageDate,
      DiaryEntry(
        drinkType: _drinkType,
        amount: _amount,
      ),
    );
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _previousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          SelectDrinkTypePage(
            onSelected: (selected) {
              _drinkType = selected;
              _nextPage();
            },
          ),
          SelectAmountPage(
            onBack: _previousPage,
            onSelected: (selected) {
              _amount = selected;
              _addEntry(context);
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
