part of 'diary_bloc.dart';

abstract class DiaryEvent extends Equatable {
  const DiaryEvent();

  @override
  List<Object> get props => [];
}

class AddEntryRequested extends DiaryEvent {
  const AddEntryRequested({
    required this.date,
    required this.entry,
  });

  final DateTime date;
  final DiaryEntry entry;

  @override
  List<Object> get props => [date, entry];
}
