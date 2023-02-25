part of 'bottom_card_page_cubit.dart';

enum BottomCardPage { details, history }

class BottomCardPageState extends Equatable {
  const BottomCardPageState({
    required this.page,
  });

  final BottomCardPage page;

  BottomCardPageState copyWith({
    BottomCardPage? page,
  }) {
    return BottomCardPageState(page: page ?? this.page);
  }

  @override
  List<Object> get props => [page];
}
