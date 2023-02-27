part of 'bottom_card_cubit.dart';

enum BottomCardStatus { open, close }

enum BottomCardPage { details, history }

@immutable
class BottomCardState extends Equatable {
  const BottomCardState({
    required this.status,

  });

  final BottomCardStatus status;


  BottomCardState copyWith({
    BottomCardStatus? status,

  }) {
    return BottomCardState(
      status: status ?? this.status,

    );
  }

  @override
  List<Object?> get props => [status];
}
