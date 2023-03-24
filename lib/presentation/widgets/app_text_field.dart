import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      height: 60,
      child: TextField(
        onChanged: (value) {},
        textAlign: TextAlign.center,
        style: AppTextStyle.h2,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyLight,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(AppBorderRadius.value),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppBorderRadius.value),
            ),
          ),
        ),
      ),
    );
  }
}
