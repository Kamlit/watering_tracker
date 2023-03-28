import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/app_color_picker.dart';
import 'package:drink_tracker/presentation/widgets/app_text_field.dart';
import 'package:drink_tracker/presentation/widgets/transparent_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NewDrinkTypeWindow extends StatefulWidget {
  const NewDrinkTypeWindow({super.key});

  @override
  State<NewDrinkTypeWindow> createState() => _NewDrinkTypeWindowState();
}

class _NewDrinkTypeWindowState extends State<NewDrinkTypeWindow> {
  Color pickedColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
            Text(
              'Name:',
              style: AppTextStyle.h2,
            ),
            AppTextField(),
            Text(
              'Color:',
              style: AppTextStyle.h2,
            ),
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (context) {
                        return AppColorPicker(
                          pickerColor: pickedColor,
                          onColorPicked: (value) {
                            pickedColor = value;
                            setState(() {});
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
                      color: pickedColor,
                    ),
                  ),
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
            )
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
            onPressed: () {},
            child: const Text('Add'),
          ),
        ),
      ],
    );
  }
}
