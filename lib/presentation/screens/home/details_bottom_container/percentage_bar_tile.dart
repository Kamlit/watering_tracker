import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/percentage_bar.dart';
import 'package:flutter/material.dart';

class PercentageBarTile extends StatelessWidget {
  const PercentageBarTile({
    super.key,
    required this.title,
    required this.amount,
    required this.percentage,
    required this.color,
  });

  final String title;
  final int amount;
  final double percentage;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey),
          ),
          Text(
            '$amount ml',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      subtitle: PercentageBar(
        backgroundColor: AppColors.greyDark,
        color: color,
        barWidth: 10,
        percentage: percentage,
      ),
    );
  }
}
