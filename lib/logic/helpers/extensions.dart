import 'package:flutter/material.dart';

extension ColorExtension on String {
  Color toColor() {
    String value = split('(0x')[1].split(')')[0]; 
    return Color(int.parse(value, radix: 16));
  }
}
