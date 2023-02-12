// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiaryEntry _$DiaryEntryFromJson(Map<String, dynamic> json) => DiaryEntry(
      drinkType: DrinkType.fromJson(json['drinkType'] as Map<String, dynamic>),
      amount: json['amount'] as int,
    );

Map<String, dynamic> _$DiaryEntryToJson(DiaryEntry instance) =>
    <String, dynamic>{
      'drinkType': instance.drinkType,
      'amount': instance.amount,
    };
