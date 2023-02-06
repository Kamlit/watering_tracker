import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class DayTitle extends StatelessWidget {
  const DayTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.arrow_left),
        Text(
          'Today',
          style: AppTextStyle.h2,
        ),
        Icon(Icons.arrow_right),
      ],
    );
  }
}
