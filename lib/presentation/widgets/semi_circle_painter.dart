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
        paint..strokeCap = StrokeCap.butt,
      );
      startAngle += _fractionToRad(progressBarFractions[i]);
    }
  }

  void _paintStartPart(Canvas canvas, Size size) {
    final offset = Offset(barWidth / 2, size.height - barWidth / 2);
    final rect = Rect.fromCenter(
      center: offset,
      width: barWidth,
      height: barWidth,
    );
    canvas.drawArc(
      rect,
      math.pi,
      -math.pi,
      true,
      Paint()..color = progressBarColors.first,
    );
  }

  void _paintEndPart(Canvas canvas, Size size) {
    final offset =
        Offset(size.width - barWidth / 2, size.height - barWidth / 2);
    final rect = Rect.fromCenter(
      center: offset,
      width: barWidth,
      height: barWidth,
    );
    canvas.drawArc(
      rect,
      math.pi,
      -math.pi,
      true,
      Paint()..color = progressBarColors.last,
    );
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
    // ignore: omit_local_variable_types
    double fractionsSum = progressBarFractions.fold(
      0,
      (previous, current) => previous + current,
    );
    _paintBackground(canvas, size, offset, rect, paint);
    _paintStartPart(canvas, size);
    _paintProgress(canvas, size, offset, rect, paint);
    if (fractionsSum == 1) _paintEndPart(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
