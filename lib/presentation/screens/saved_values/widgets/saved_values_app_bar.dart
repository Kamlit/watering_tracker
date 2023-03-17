import 'package:drink_tracker/logic/cubits/page/page_cubit.dart';
import 'package:drink_tracker/presentation/routing/router.dart';
import 'package:drink_tracker/presentation/routing/routes.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/calendar.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/day_title.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:drink_tracker/presentation/widgets/transparent_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedValuesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SavedValuesAppBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return TransparentAppBar(
      height: 80,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.arrow_back),
        padding: const EdgeInsets.all(15),
      ),
      actions: [
        // IconButton(
        //   onPressed: () => Navigator.of(context).popAndPushNamed(
        //     Routes.homeScreen,
        //   ),
        //   icon: const Icon(Icons.home),
        //   padding: const EdgeInsets.all(15),
        // ),
      ],
      title: const Text(
        'Saved values',
        style: AppTextStyle.h2,
      ),
    );
  }
}
