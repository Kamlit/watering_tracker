part of 'day_page_cubit.dart';

class DayPageState extends Equatable {
  const DayPageState({
    required this.totalAmount,
    required this.entries,
    required this.pageDate,
  });

  final int totalAmount;
  final List<DiaryEntry> entries;
  final DateTime pageDate;

  DayPageState copyWith({
    List<DiaryEntry>? entries,
    int? totalAmount,
    DateTime? pageDate,
  }) {
    return DayPageState(
      totalAmount: totalAmount ?? this.totalAmount,
      entries: entries ?? this.entries,
      pageDate: pageDate ?? this.pageDate,
    );
  }

  @override
  List<Object> get props => [entries, pageDate, totalAmount];
}
