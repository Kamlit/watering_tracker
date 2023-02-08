import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/models/drink_type.dart';
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
                onTap: () => onSelected(drinkTypes[index]),
                title: Text(
                  drinkTypes[index].name,
                  style: AppTextStyle.h3,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
