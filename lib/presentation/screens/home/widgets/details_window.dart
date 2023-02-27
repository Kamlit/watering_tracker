import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/percentage_bar_tile.dart';
import 'package:flutter/material.dart';

class DetailsWindow extends StatelessWidget {
  const DetailsWindow({
    super.key,
    required this.data,
  });

  final DiaryData data;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: List.generate(
            data.drinkTypesColors.length,
            (index) {
              return PercentageBarTile(
                title: data.drinkTypesTotalAmount.keys.elementAt(index),
                amount: data.drinkTypesTotalAmount.values.elementAt(index),
                percentage: data.drinkTypesFractions[index],
                color: data.drinkTypesColors[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
