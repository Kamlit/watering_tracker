import 'package:bloc/bloc.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:drink_tracker/logic/repositories/diary_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'diary_event.dart';
part 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc({required this.diaryRepository}) : super(DiaryLoading()) {
    on<AddEntry>(_onAddEntryRequested);
  }

  void _onAddEntryRequested(
    AddEntry event,
    Emitter<DiaryState> emit,
  ) {
    emit(DiaryLoading());
    try {
      diaryRepository.addEntry(
        date: event.date,
        entry: event.entry,
      );
      final entries = diaryRepository.diary[event.date];
      final totalAmount = diaryRepository.totalAmount(event.date);
      emit(
        DiaryLoaded(
          entries: entries!,
          totalAmount: totalAmount,
        ),
      );
    } catch (e) {
      emit(DiaryError(e.toString()));
    }
  }

  final DiaryRepository diaryRepository;
}
