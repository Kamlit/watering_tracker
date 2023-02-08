import 'package:drink_tracker/logic/models/drink_type.dart';

class DiaryEntry {
  DiaryEntry({
    required this.drinkType,
    required this.amount,
  });
  
  final DrinkType drinkType;
  final int amount;

  @override
  String toString() {
    return 'DiaryEntry{${drinkType.name}, $amount}';
  }
}
