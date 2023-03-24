import 'package:drink_tracker/logic/cubits/page/page_cubit.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/calendar.dart';
import 'package:drink_tracker/presentation/screens/home/widgets/day_title.dart';
import 'package:drink_tracker/presentation/widgets/transparent_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return TransparentAppBar(
      height: height,
      title: const DayTitle(),
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu),
        padding: const EdgeInsets.all(15),
      ),
      actions: [
        IconButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<PageCubit>(context),
                  child: const Calendar(),
                );
              },
            );
          },
          icon: const Icon(Icons.calendar_month),
          padding: const EdgeInsets.all(15),
        ),
      ],
    );
  }
}
