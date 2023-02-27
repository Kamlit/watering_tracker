// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryState _$DiaryStateFromJson(Map<String, dynamic> json) => DiaryState(
      diary: (json['diary'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            DateTime.parse(k),
            (e as List<dynamic>)
                .map((e) => DiaryEntry.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
      goal: json['goal'] as int,
    );

Map<String, dynamic> _$DiaryStateToJson(DiaryState instance) =>
    <String, dynamic>{
      'diary': instance.diary?.map((k, e) => MapEntry(k.toIso8601String(), e)),
      'goal': instance.goal,
    };
