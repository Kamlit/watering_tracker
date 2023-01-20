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
          child: SizedBox(
            height: size/2*10,
            width: size*10,
            child: CustomPaint(
              painter: SemiCirclePainter(
                backgroundColor: const Color.fromARGB(255, 56, 56, 56),
                progressBarColor: Colors.amber,
                progressBarFraction: 0.3,
                barWidth: 20,
              ),
            ),
          ),
        ),
        Positioned.fill(
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
