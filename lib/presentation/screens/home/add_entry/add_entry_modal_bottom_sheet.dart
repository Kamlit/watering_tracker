import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/blocs/diary/diary_bloc.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/logic/models/drink_type.dart';
import 'package:drink_tracker/presentation/style.dart';
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
  late int _mililitres;

  void _addEntry(BuildContext context) {
    final now = DateTime.now();
    BlocProvider.of<DiaryBloc>(context).add(
      AddEntryRequested(
        date: DateTime(now.year, now.month, now.day),
        entry: DiaryEntry(
          drinkType: _drinkType,
          mililitres: _mililitres,
        ),
      ),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Drink type',
                    style: AppTextStyle.h2,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: drinkTypes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        _drinkType = drinkTypes[index];
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease,
                        );
                      },
                      title: Text(
                        drinkTypes[index].name,
                        style: AppTextStyle.h3,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Amount',
                    style: AppTextStyle.h2,
                  ),
                ),
              ),
              Expanded(
                child: TextField(
                  onSubmitted: (value) {
                    _mililitres = int.parse(value);
                    _addEntry(context);
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  _pageController.previousPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
