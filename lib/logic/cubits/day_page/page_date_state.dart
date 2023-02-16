part of 'page_date_cubit.dart';

class PageDateState extends Equatable {
  const PageDateState({
    required this.pageDate,
  });

  final DateTime pageDate;

  PageDateState copyWith({
    DateTime? pageDate,
  }) {
    return PageDateState(
      pageDate: pageDate ?? this.pageDate,
    );
  }

  @override
  List<Object> get props => [pageDate];
}
