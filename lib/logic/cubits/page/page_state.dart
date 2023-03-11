part of 'page_cubit.dart';

enum PageStatus { changed, jumpRequested }

class PageState extends Equatable {
  const PageState({
    required this.status,
    required this.pageDate,
  });

  final PageStatus status;
  final DateTime pageDate;

  PageState copyWith({
    PageStatus? status,
    DateTime? pageDate,
  }) {
    return PageState(
      status: status ?? this.status,
      pageDate: pageDate ?? this.pageDate,
    );
  }

  @override
  List<Object> get props => [status, pageDate];
}
