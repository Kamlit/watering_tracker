import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(
        borderRadius: AppBorderRadius.all,
      ),
      onTap: onTap,
      title: Text(
        title,
        style: AppTextStyle.h2,
      ),
      leading: Icon(
        icon,
        color: AppColors.greyLight,
      ),
    );
  }
}
