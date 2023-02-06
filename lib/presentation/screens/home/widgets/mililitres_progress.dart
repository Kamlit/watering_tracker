import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class MililitresProgress extends StatelessWidget {
  const MililitresProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            '1200 ml',
            style: AppTextStyle.h1White,
          ),
          Text(
            'Goal: 2000 ml',
            style: AppTextStyle.h3,
          ),
          Text(
            '800 ml left',
            style: AppTextStyle.h3,
          ),
        ],
      ),
    );
  }
}
