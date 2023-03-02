import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';
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
          child: ListView.builder(
            itemCount: drinkTypes.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => onSelected(drinkTypes[index]),
                title: Center(
                  child: Text(
                    drinkTypes[index].name,
                    style: AppTextStyle.h3,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Icon(
                    Icons.circle,
                    size: 9,
                    color: drinkTypes[index].color.toColor(),
                  ),
                ),
              );
            },
          ),
        ),
      
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add,
                  color: AppColors.greyLight,
                  size: 25,
                ),
              ),
              Text('Add drink type', style: TextStyle(color: AppColors.greyLight),),
            ],
          ),
        ),
      ],
    );
  }
}
