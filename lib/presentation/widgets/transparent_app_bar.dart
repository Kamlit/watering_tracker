import 'package:drink_tracker/logic/cubits/page/page_cubit.dart';
import 'package:drink_tracker/presentation/widgets/calendar.dart';
import 'package:drink_tracker/presentation/widgets/day_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransparentAppBar extends StatefulWidget implements PreferredSizeWidget {
  const TransparentAppBar({super.key, required this.height});

  final double height;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  State<TransparentAppBar> createState() => _TransparentAppBarState();
}

class _TransparentAppBarState extends State<TransparentAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.height,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      title: const DayTitle(),
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu),
        padding: const EdgeInsets.all(15),
      ),
      actions: [
        IconButton(
          onPressed: () async {
            await showDialog<void>(
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
