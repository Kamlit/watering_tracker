part of 'diary_cubit.dart';

@JsonSerializable()
class DiaryState {
  const DiaryState({
    this.diary,
    required this.goal,
  });

  factory DiaryState.fromJson(Map<String, dynamic> json) =>
      _$DiaryStateFromJson(json);

  DiaryState copyWith({
    Map<DateTime, List<DiaryEntry>>? diary,
    int? goal,
  }) {
    return DiaryState(diary: diary ?? this.diary, goal: goal ?? this.goal);
  }

  Map<String, dynamic> toJson() => _$DiaryStateToJson(this);

  final Map<DateTime, List<DiaryEntry>>? diary;
  final int goal;

  DiaryData getDiaryData(DateTime date) {
    if (diary![date] == null) {
      return DiaryData.empty();
    } else {
      final entries = diary![date]!;
      var totalAmount = 0;
      var drinkTypesTotalAmount = <String, int>{};
      var drinkTypesFractions = <double>[];
      var drinkTypesColors = <Color>[];
      var goalPercentage = 0;

      for (var element in entries) {
        totalAmount += element.amount;
        if (drinkTypesTotalAmount.containsKey(element.drinkType.name)) {
          drinkTypesTotalAmount[element.drinkType.name] =
              element.amount + drinkTypesTotalAmount[element.drinkType.name]!;
        } else {
          drinkTypesTotalAmount[element.drinkType.name] = element.amount;
        }
      }
      for (var element in drinkTypesTotalAmount.entries) {
        drinkTypesFractions.add(element.value / max(goal, totalAmount));
      }
      for (var name in drinkTypesTotalAmount.keys) {
        for (var drinkType in drinkTypes) {
          if (name == drinkType.name) {
            drinkTypesColors.add(drinkType.color.toColor());
          }
        }
      }
      goalPercentage = ((totalAmount / goal) * 100).round();

      return DiaryData(
        entries: entries,
        totalAmount: totalAmount,
        goalPercentage: goalPercentage,
        drinkTypesTotalAmount: drinkTypesTotalAmount,
        drinkTypesFractions: drinkTypesFractions,
        drinkTypesColors: drinkTypesColors,
      );
    }
  }

  List<DiaryEntry>? _getDiaryEntriesFromDate(DateTime date) {
    return diary![date];
  }

  int _getTotalAmountFromDate(DateTime date) {
    if (!diary!.containsKey(date)) return 0;

    final entries = List.of(diary![date] ?? <DiaryEntry>[]);
    var total = 0;
    return 0;
  }

  Map<String, int>? _getDrinkTypesTotalAmount(DateTime date) {
    final entries = diary![date];
    if (entries == null) return null;
    var map = <String, int>{};
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

  List<double> _getDrinkTypesFractions({
    required Map<String, int>? map,
    required int totalAmount,
  }) {
    var fractions = <double>[];
    if (map != null) {
      for (var element in map.entries) {
        fractions.add(element.value / max(goal, totalAmount));
      }
    }
    return fractions;
  }

  List<Color> _getDrinkTypesColors({
    required Map<String, int>? map,
  }) {
    var colors = <Color>[];
    if (map != null) {
      for (var name in map.keys) {
        for (var drinkType in drinkTypes) {
          if (name == drinkType.name) {
            colors.add(drinkType.color.toColor());
          }
        }
      }
    }
    return colors;
  }
}
