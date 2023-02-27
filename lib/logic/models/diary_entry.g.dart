// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryEntry _$DiaryEntryFromJson(Map<String, dynamic> json) => DiaryEntry(
      drinkType: DrinkType.fromJson(json['drinkType'] as Map<String, dynamic>),
      amount: json['amount'] as int,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$DiaryEntryToJson(DiaryEntry instance) =>
    <String, dynamic>{
      'drinkType': instance.drinkType,
      'amount': instance.amount,
      'date': instance.date.toIso8601String(),
    };
