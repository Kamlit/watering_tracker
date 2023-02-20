import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:flutter/material.dart';

class DiaryData {
  const DiaryData({
    required this.entries,
    required this.totalAmount,
    required this.goalPercentage,
    required this.drinkTypesTotalAmount,
    required this.drinkTypesFractions,
    required this.drinkTypesColors,
  });

  DiaryData.empty()
      : entries = [],
        totalAmount = 0,
        goalPercentage = 0,
        drinkTypesTotalAmount = {},
        drinkTypesColors = [],
        drinkTypesFractions = [];

  final List<DiaryEntry> entries;
  final int totalAmount;
  final int goalPercentage;
  final Map<String, int> drinkTypesTotalAmount;
  final List<double> drinkTypesFractions;
  final List<Color> drinkTypesColors;
}
