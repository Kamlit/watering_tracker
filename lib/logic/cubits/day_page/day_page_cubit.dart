import 'package:bloc/bloc.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';
import 'package:equatable/equatable.dart';

part 'day_page_state.dart';

class DayPageCubit extends Cubit<DayPageState> {
  DayPageCubit()
      : super(
          DayPageState(
            entries: const [],
            page: 1000,
            pageDate: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
          ),
        );

  void onDiaryLoaded(List<DiaryEntry> entries) {
    emit(state.copyWith(entries: entries));
  }

  void onPageChanged(bool isNextPage){
    
  }
}
