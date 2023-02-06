import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class DetailsBottomContainer extends StatelessWidget {
  const DetailsBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.dark,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
          Text(
            'Details',
            style: AppTextStyle.h2,
          ),
          Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
