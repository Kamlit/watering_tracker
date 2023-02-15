import 'package:bloc/bloc.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'diary_state.dart';
part 'diary_cubit.g.dart';

class DiaryCubit extends HydratedCubit<DiaryState> {
  DiaryCubit()
      : super(
          const DiaryState(
            diary: {},
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

  List<DiaryEntry>? getDiaryEntriesFromDate(DateTime date) {
    return state.diary![date];
  }

  int getTotalAmountFromDate(DateTime date) {
    if (!state.diary!.containsKey(date)) return 0;
    
    final entries = List.of(state.diary![date]!);
    var total = 0;
    for (final element in entries) {
      total += element.amount;
    }
    return total;
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
