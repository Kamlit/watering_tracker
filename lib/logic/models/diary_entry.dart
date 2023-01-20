import 'package:drink_tracker/logic/models/drink_type.dart';

class DiaryEntry {
  DiaryEntry({
    required this.date,
    required this.data,
  });
  
  final DateTime date;
  final Map<DrinkType, int> data;
}
