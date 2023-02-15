import 'package:drink_tracker/presentation/widgets/semi_circle_painter.dart';
import 'package:drink_tracker/presentation/style.dart';
import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class SemiCircularProgressBar extends StatelessWidget {
  const SemiCircularProgressBar({super.key, required this.size});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: CustomPaint(
            size: Size(size * 10, size / 2 * 10),
            painter: SemiCirclePainter(
              backgroundColor: const Color.fromARGB(255, 56, 56, 56),
              progressBarColors: [Colors.amber, Colors.green, Colors.blue],
              progressBarFractions: [0.5, 0.3, 0.2],
              barWidth: 20,
            ),
          ),
        ),
        const Positioned.fill(
          top: 50,
          child: Center(
            child: Text(
              '30%',
              style: AppTextStyle.h1Grey,
            ),
          ),
        )
      ],
    );
  }
}
