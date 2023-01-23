import 'package:drink_tracker/presentation/screens/home/semi_circle_painter.dart';
import 'package:flutter/material.dart';

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
              progressBarFractions: [0.1, 0.1, 0.1],
              barWidth: 20,
            ),
          ),
        ),
        const Positioned.fill(
          top: 50,
          child: Center(
            child: Text(
              '30%',
              style: TextStyle(
                fontSize: 50,
                color: Color.fromARGB(127, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
