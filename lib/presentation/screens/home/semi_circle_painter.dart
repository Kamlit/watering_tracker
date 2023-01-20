import 'dart:math' as math;

import 'package:flutter/material.dart';

class SemiCirclePainter extends CustomPainter {
  SemiCirclePainter({
    required this.backgroundColor,
    required this.progressBarColor,
    required this.progressBarFraction,
    required this.barWidth,
  });

  final Color backgroundColor;
  final Color progressBarColor;
  final double progressBarFraction;
  final double barWidth;

  double _degToRad(double degree) {
    return degree * math.pi / 180;
  }

  double _fractionToRad(double fraction) {
    final degree = 180 * fraction;
    return _degToRad(degree);
  }

  void _drawArc(
    Canvas canvas,
    Size size, {
    required double sweepAngle,
    required Color paintColor,
  }) {
    const startAngle = -math.pi;
    final strokeWidth = barWidth;

    final offset = Offset(size.width / 2, size.height - strokeWidth / 2);
    final rect = Rect.fromCenter(
      center: offset,
      width: size.width - strokeWidth,
      height: size.height * 2 - strokeWidth * 2,
    );
    final paint = Paint()
      // ..shader = RadialGradient(
      //   colors: [Colors.amber, Colors.white, Colors.cyan],
      //   transform: GradientRotation(_degToRad(0)),
      //   stops: const [0.2, 0.2, 0.2],
      // ).createShader(rect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..color = paintColor
      ..strokeWidth = strokeWidth;
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  void _paintBackground(Canvas canvas, Size size) {
    _drawArc(
      canvas,
      size,
      sweepAngle: math.pi,
      paintColor: backgroundColor,
    );
  }

  void _paintProgress(Canvas canvas, Size size) {
    _drawArc(
      canvas,
      size,
      sweepAngle: math.min(math.pi, _fractionToRad(progressBarFraction)),
      paintColor: progressBarColor,
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    _paintBackground(canvas, size);
    _paintProgress(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
