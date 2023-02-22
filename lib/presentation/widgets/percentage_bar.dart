import 'dart:math' as math;

import 'package:flutter/material.dart';

class PercentageBar extends StatelessWidget {
  const PercentageBar({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.percentage,
    required this.barWidth,
  });

  final Color backgroundColor;
  final Color color;
  final double percentage;
  final double barWidth;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PercentageBarPainter(
        backgroundColor: backgroundColor,
        color: color,
        percentage: percentage,
        barWidth: barWidth,
      ),
      size: Size(double.infinity, barWidth),
    );
  }
}

class PercentageBarPainter extends CustomPainter {
  PercentageBarPainter({
    required this.backgroundColor,
    required this.color,
    required this.percentage,
    required this.barWidth,
  });

  final Color backgroundColor;
  final Color color;
  final double percentage;
  final double barWidth;

  void _paintBackground(
    Canvas canvas,
    Size size,
    Paint paint,
  ) {
    var startPoint = Offset(barWidth / 2, size.height / 2);
    var endPoint = Offset(size.width - barWidth / 2, size.height / 2);
    canvas.drawLine(startPoint, endPoint, paint..color = backgroundColor);
  }

  void _paintProgress(
    Canvas canvas,
    Size size,
    Paint paint,
  ) {
    var startPoint = Offset(barWidth / 2, size.height / 2);
    var endPoint =
        Offset(size.width * percentage - barWidth / 2, size.height / 2);
    canvas.drawLine(startPoint, endPoint, paint..color = color);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = barWidth;
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    _paintBackground(canvas, size, paint);
    _paintProgress(canvas, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
