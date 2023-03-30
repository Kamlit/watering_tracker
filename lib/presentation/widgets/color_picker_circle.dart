import 'package:drink_tracker/logic/cubits/edit_drink_type/edit_drink_type_cubit.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/app_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorPickerCircle extends StatelessWidget {
  const ColorPickerCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocBuilder<EditDrinkTypeCubit, EditDrinkTypeState>(
          buildWhen: (previous, current) => previous.color != current.color,
          builder: (context, state) {
            return InkWell(
              onTap: () {
                showDialog<void>(
                  context: context,
                  builder: (_) {
                    return AppColorPicker(
                      pickerColor: state.color,
                      onColorPicked: (value) {
                        BlocProvider.of<EditDrinkTypeCubit>(context)
                            .updateColor(value);
                      },
                    );
                  },
                );
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(90),
                  ),
                  border: Border.all(color: AppColors.greyLight),
                  color: state.color,
                ),
              ),
            );
          },
        ),
        // CircleAvatar(
        //   radius: 10,
        //   child: Icon(
        //     Icons.edit_outlined,
        //     size: 12,
        //   ),
        //   backgroundColor: AppColors.dark,
        // ),
      ],
    );
  }
}
