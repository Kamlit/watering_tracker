import 'package:drink_tracker/presentation/widgets/day_title.dart';
import 'package:flutter/material.dart';

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
      titleTextStyle: const TextStyle(),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: widget.height,
      centerTitle: true,
      title: const DayTitle(),
      leading: IconButton(
        onPressed: () => Scaffold.of(context).openDrawer(),
        icon: const Icon(Icons.menu),
        padding: const EdgeInsets.all(15),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.calendar_month),
          padding: const EdgeInsets.all(15),
        ),
      ],
    );
  }
}
