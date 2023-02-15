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
}
