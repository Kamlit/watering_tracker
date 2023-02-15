import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:equatable/equatable.dart';

part 'day_page_state.dart';

class DayPageCubit extends Cubit<DayPageState> {
  DayPageCubit()
      : super(
          DayPageState(
            totalAmount: 0,
            entries: const [],
            pageDate: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
          ),
        );

  void loadEntries({
    required List<DiaryEntry>? entries,
  }) {
    emit(state.copyWith(entries: entries));
  }

  void onPageChanged({
    required DateTime newPageDate,
    required List<DiaryEntry>? entries,
  }) {

    emit(
      state.copyWith(
        totalAmount: _totalAmount(entries),
        entries: entries ?? [],
        pageDate: newPageDate,
      ),
    );
  }

  int _totalAmount(List<DiaryEntry>? entries) {
    var total = 0;
    for (final element in state.entries) {
      total += element.amount;
    }
    return total;
  }
}
