import 'package:drink_tracker/presentation/widgets/app_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppColorPicker extends StatelessWidget {
  const AppColorPicker({
    super.key,
    required this.onColorPicked,
    required this.pickerColor,
  });

  final void Function(Color) onColorPicked;
  final Color pickerColor;

  @override
  Widget build(BuildContext context) {
    var pickedColor = pickerColor;
    return AppAlertDialog(
      content: ColorPicker(
        pickerColor: pickedColor,
        onColorChanged: (value) {
          pickedColor = value;
        },
        pickerAreaHeightPercent: 0.8,
        enableAlpha: false,
        labelTypes: const [],
      ),
      action: TextButton(
        onPressed: () {
          onColorPicked(pickedColor);
          Navigator.of(context).pop();
        },
        child: const Text('Choose'),
      ),
    );
  }
}
