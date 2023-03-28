import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.content,
    required this.action,
  });

  final Widget content;
  final Widget? action;

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
        height: 400,
        child: content,
      ),
      actionsPadding: const EdgeInsets.only(top: 20),
      actions: [
        if (action != null)
          Container(
            width: 400,
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: AppBorderRadius.all,
            ),
            child: action,
          )
        else
          const SizedBox(),
      ],
    );
    ;
  }
}
