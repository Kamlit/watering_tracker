import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class CustomAmountWindow extends StatefulWidget {
  const CustomAmountWindow({
    super.key,
    required this.onSelected,
  });

  final void Function(int amount) onSelected;

  @override
  State<CustomAmountWindow> createState() => _CustomAmountWindowState();
}

class _CustomAmountWindowState extends State<CustomAmountWindow> {
  int _amount = 250;

  void _onAddPressed() {
    Navigator.of(context).pop();
    widget.onSelected(_amount);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: AppBorderRadius.all),
      backgroundColor: AppColors.backgroundColor,
      titlePadding: const EdgeInsets.all(20),
      title: Center(
        child: Text(
          '$_amount ml',
          style: AppTextStyle.h2,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 20),
      content: SizedBox(
        width: 600,
        height: 50,
        child: Slider(
          onChanged: (double value) {
            _amount = value.toInt();
            setState(() {});
          },
          value: _amount.toDouble(),
          max: 2000,
          min: 10,
          divisions: 199,
        ),
      ),
      actionsPadding: const EdgeInsets.all(15),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: _onAddPressed,
          child: const Text('Add', style: AppTextStyle.h3),
        ),
      ],
    );
  }
}
