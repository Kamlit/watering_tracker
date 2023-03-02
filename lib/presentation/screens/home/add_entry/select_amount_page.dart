import 'package:drink_tracker/TEMP_amounts.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class SelectAmountPage extends StatelessWidget {
  const SelectAmountPage({
    super.key,
    required this.onBack,
    required this.onSelected,
  });

  final void Function() onBack;
  final void Function(int amount) onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: AppColors.white,
                        onPressed: onBack,
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Amount',
                  style: AppTextStyle.h2,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: amounts.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => onSelected(amounts[index]),
                child: GridTile(
                  child: Center(
                    child: Text(
                      '${amounts[index]} ml',
                      style: AppTextStyle.h3,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: AppColors.greyLight,
                  size: 25,
                ),
              ),
              const Text(
                'Add amount',
                style: TextStyle(color: AppColors.greyLight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
