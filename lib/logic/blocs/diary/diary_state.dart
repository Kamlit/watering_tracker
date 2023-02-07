part of 'diary_bloc.dart';

@immutable
abstract class DiaryState extends Equatable {
  const DiaryState();
}

class DiaryInitial extends DiaryState {
  @override
  List<Object> get props => [];
}

class DiaryLoading extends DiaryState {
  @override
  List<Object> get props => [];
}

class DiaryLoaded extends DiaryState {
  const DiaryLoaded(this.diary);

  final Map<DateTime, List<DiaryEntry>> diary;
  @override
  List<Object> get props => [];
}

class DiaryError extends DiaryState {
  const DiaryError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
