import 'dart:math';

import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/helpers/extensions.dart';
import 'package:drink_tracker/logic/models/diary_data.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:json_annotation/json_annotation.dart';

part 'diary_state.dart';
part 'diary_cubit.g.dart';

class DiaryCubit extends HydratedCubit<DiaryState> {
  DiaryCubit()
      : super(
          const DiaryState(
            diary: {},
            goal: 2000,
          ),
        );

  void addEntry(DateTime date, DiaryEntry entry) {
    final diary = Map.of(state.diary!);
    if (diary.containsKey(date)) {
      diary[date]!.add(entry);
    } else {
      diary[date] = [entry];
    }

    emit(state.copyWith(diary: diary));
  }

  void deleteEntry(DateTime date, DiaryEntry entry ) {
    final diary = Map.of(state.diary!);
    diary[date]!.remove(entry);
    
    emit(state.copyWith(diary: diary));
  }

  @override
  DiaryState? fromJson(Map<String, dynamic> json) {
    return DiaryState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(DiaryState state) {
    return state.toJson();
  }
}
