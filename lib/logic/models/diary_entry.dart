import 'package:drink_tracker/logic/models/drink_type.dart';

class DiaryEntry {
  DiaryEntry({
    required this.drinkType,
    required this.mililitres,
  });
  
  final DrinkType drinkType;
  final int mililitres;
}
