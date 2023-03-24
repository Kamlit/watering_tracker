import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AppColorPicker extends StatelessWidget {
  const AppColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: ColorPicker(
        pickerColor: Colors.red,
        onColorChanged: (value) {},
      ),
    );
  }
}
