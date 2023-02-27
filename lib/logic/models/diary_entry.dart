import 'package:drink_tracker/logic/models/drink_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_entry.g.dart';

@JsonSerializable()
class DiaryEntry {
  DiaryEntry({
    required this.drinkType,
    required this.amount,
    required this.date,
  });

  factory DiaryEntry.fromJson(Map<String, dynamic> json) =>
      _$DiaryEntryFromJson(json);

  final DrinkType drinkType;
  final int amount;
  final DateTime date;

  Map<String, dynamic> toJson() => _$DiaryEntryToJson(this);

  @override
  String toString() {
    return 'DiaryEntry{${drinkType.name}, $amount, $date}';
  }
}
