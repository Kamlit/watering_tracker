part of 'day_page_cubit.dart';

class DayPageState extends Equatable {
  const DayPageState({
    required this.entries,
    required this.page,
    required this.pageDate,
  });

  final List<DiaryEntry> entries;
  final int page;
  final DateTime pageDate;

  DayPageState copyWith({
    List<DiaryEntry>? entries,
    int? page,
    DateTime? pageDate,
  }) {
    return DayPageState(
      entries: entries ?? this.entries,
      page: page ?? this.page,
      pageDate: pageDate ?? this.pageDate,
    );
  }

  @override
  List<Object> get props => [entries, page, pageDate];
}
