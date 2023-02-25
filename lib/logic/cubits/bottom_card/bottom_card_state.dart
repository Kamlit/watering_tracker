part of 'bottom_card_cubit.dart';

enum BottomCardStatus { open, close }

enum BottomCardPage { details, history }

@immutable
class BottomCardState extends Equatable {
  const BottomCardState({
    required this.status,
    required this.page,
  });

  final BottomCardStatus status;
  final BottomCardPage page;

  BottomCardState copyWith({
    BottomCardStatus? status,
    BottomCardPage? page,
  }) {
    return BottomCardState(
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [status, page];
}
