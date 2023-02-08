part of 'diary_bloc.dart';

abstract class DiaryEvent extends Equatable {
  const DiaryEvent();

  @override
  List<Object> get props => [];
}

class AddEntry extends DiaryEvent {
  const AddEntry({
    required this.date,
    required this.entry,
  });

  final DateTime date;
  final DiaryEntry entry;

  @override
  List<Object> get props => [date, entry];
}

class ChangeDate extends DiaryEvent {
  const ChangeDate({
    required this.date,
  });

  final DateTime date;

  @override
  List<Object> get props => [date];
}
