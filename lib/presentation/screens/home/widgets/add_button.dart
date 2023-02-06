import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.greyDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(90),
            ),
            minimumSize: const Size(60, 60),
          ),
          child: const Icon(
            Icons.add,
          ),
        ),
      ],
    );
  }
}
