import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class DetailsBottomContainer extends StatelessWidget {
  const DetailsBottomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height - 80,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        children: const [
          Icon(
            Icons.arrow_drop_up_sharp,
            color: AppColors.white,
          ),
          Text(
            'Details',
            style: AppTextStyle.h2,
          ),
        ],
      ),
    );
  }
}
