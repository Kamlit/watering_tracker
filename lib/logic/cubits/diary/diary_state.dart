part of 'diary_cubit.dart';

@JsonSerializable()
class DiaryState {

  const DiaryState({
    this.diary,
  });

  factory DiaryState.fromJson(Map<String, dynamic> json) =>
      _$DiaryStateFromJson(json);

  Map<String, dynamic> toJson() => _$DiaryStateToJson(this);

  final Map<DateTime, List<DiaryEntry>>? diary;
}
