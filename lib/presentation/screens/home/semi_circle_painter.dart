import 'dart:math' as math;

import 'package:flutter/material.dart';

class SemiCirclePainter extends CustomPainter {
  SemiCirclePainter({
    required this.backgroundColor,
    required this.progressBarColors,
    required this.progressBarFractions,
    required this.barWidth,
  });

  final Color backgroundColor;
  final List<Color> progressBarColors;
  final List<double> progressBarFractions;
  final double barWidth;

  double _degToRad(double degree) {
    return degree * math.pi / 180;
  }

  double _fractionToRad(double fraction) {
    final degree = 180 * fraction;
    return _degToRad(degree);
  }

  void _paintBackground(
    Canvas canvas,
    Size size,
    Offset offset,
    Rect rect,
    Paint paint,
  ) {
    const startAngle = -math.pi;
    const sweepAngle = math.pi;
    paint
      ..color = backgroundColor
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  void _paintProgress(
    Canvas canvas,
    Size size,
    Offset offset,
    Rect rect,
    Paint paint,
  ) {
    var startAngle = -math.pi;
    for (var i = 0; i < progressBarColors.length; i++) {
      final sweepAngle = _fractionToRad(progressBarFractions[i]);
      paint.color = progressBarColors[i];

      canvas.drawArc(
        rect,
        startAngle,
        sweepAngle,
        false,
        paint..strokeCap = StrokeCap.round,
      );
      startAngle += _fractionToRad(progressBarFractions[i]);
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = barWidth;
    final offset = Offset(size.width / 2, size.height - strokeWidth / 2);
    final rect = Rect.fromCenter(
      center: offset,
      width: size.width - strokeWidth,
      height: size.height * 2 - strokeWidth * 2,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    _paintBackground(canvas, size, offset, rect, paint);
    _paintProgress(canvas, size, offset, rect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
