part of 'page_date_cubit.dart';

enum PageDateStatus { changed, jumped }

class PageDateState extends Equatable {
  const PageDateState({
    required this.status,
    required this.pageDate,
  });

  final PageDateStatus status;
  final DateTime pageDate;

  PageDateState copyWith({
    PageDateStatus? status,
    DateTime? pageDate,
  }) {
    return PageDateState(
      status: status ?? this.status,
      pageDate: pageDate ?? this.pageDate,
    );
  }

  @override
  List<Object> get props => [status, pageDate];
}
