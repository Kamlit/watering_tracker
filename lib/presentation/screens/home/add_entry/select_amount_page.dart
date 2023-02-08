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
            style: const TextStyle(
              color: AppColors.greyLight,
            ),
            onSubmitted: (value) {
              onSelected(int.parse(value));
            },
          ),
        ),
        TextButton(
          onPressed: onBack,
          child: const Text('Back'),
        ),
      ],
    );
  }
}
