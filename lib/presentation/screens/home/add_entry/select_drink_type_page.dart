import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';
import 'package:drink_tracker/logic/models/drink_type.dart';
import 'package:drink_tracker/presentation/screens/home/add_entry/drink_types_grid_view.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class SelectDrinkTypePage extends StatelessWidget {
  const SelectDrinkTypePage({required this.onSelected, super.key});

  final void Function(DrinkType selected) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 70,
          child: Center(
            child: Text(
              'Drink type',
              style: AppTextStyle.h2,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: DrinkTypesGridView(
              onSelected: onSelected,
            ),
          ),
        ),
      ],
    );
  }
}
