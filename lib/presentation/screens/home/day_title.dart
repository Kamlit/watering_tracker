import 'package:flutter/material.dart';

class DayTitle extends StatelessWidget {
  const DayTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.arrow_left),
        Text('Today'),
        Icon(Icons.arrow_right),
      ],
    );
  }
}
