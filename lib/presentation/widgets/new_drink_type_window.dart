import 'package:drink_tracker/logic/cubits/edit_drink_type/edit_drink_type_cubit.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/app_text_field.dart';
import 'package:drink_tracker/presentation/widgets/color_picker_circle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewDrinkTypeWindow extends StatelessWidget {
  const NewDrinkTypeWindow({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: AppBorderRadius.all,
        ),
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: AppBorderRadius.all,
          ),
          width: 1000,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Name:',
                style: AppTextStyle.h2,
              ),
              AppTextField(
                onChanged: (value) {
                  BlocProvider.of<EditDrinkTypeCubit>(context)
                      .updateName(value);
                },
              ),
              const Text(
                'Color:',
                style: AppTextStyle.h2,
              ),
              const ColorPickerCircle(),
            ],
          ),
        ),
        actionsPadding: const EdgeInsets.only(top: 20),
        actions: [
          Container(
            width: 400,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: AppBorderRadius.all,
            ),
            child: TextButton(
              onPressed: () {
                // BlocProvider.of<SavedValuesCubit>(context);
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}
