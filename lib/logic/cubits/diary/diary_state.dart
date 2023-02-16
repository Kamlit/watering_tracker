part of 'diary_cubit.dart';

@JsonSerializable()
class DiaryState {
  const DiaryState({
    this.diary,
  });

  factory DiaryState.fromJson(Map<String, dynamic> json) =>
      _$DiaryStateFromJson(json);

  DiaryState copyWith({Map<DateTime, List<DiaryEntry>>? diary}) {
    return DiaryState(diary: diary ?? this.diary);
  }

  Map<String, dynamic> toJson() => _$DiaryStateToJson(this);

  final Map<DateTime, List<DiaryEntry>>? diary;

  List<DiaryEntry>? getDiaryEntriesFromDate(DateTime date) {
    return diary![date];
  }

  int getTotalAmountFromDate(DateTime date) {
    if (!diary!.containsKey(date)) return 0;

    final entries = List.of(diary![date] ?? <DiaryEntry>[]);
    var total = 0;
    for (final element in entries) {
      total += element.amount;
    }
    return total;
  }

  Map<String, int>? getDrinkTypesTotalAmount(DateTime date) {
    final entries = diary![date];
    if (entries == null) return null;
    Map<String, int> map = {};
    for (var element in entries) {
      if (map.containsKey(element.drinkType.name)) {
        map[element.drinkType.name] =
            element.amount + map[element.drinkType.name]!;
      } else {
        map[element.drinkType.name] = element.amount;
      }
    }
    return map;
  }

  // List<double> getDrinkTypesFraction(Map<DrinkType, int> map, int goal)  {
  //   final List<double> fractions = [];
  //   map.entries.forEach((element) {
  //     fractions.add(element.value / )
  //   });
  // }
}
