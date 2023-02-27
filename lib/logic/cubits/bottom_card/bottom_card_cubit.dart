import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_card_state.dart';

class BottomCardCubit extends Cubit<BottomCardState> {
  BottomCardCubit()
      : super(
          const BottomCardState(
            status: BottomCardStatus.close,
          ),
        );

  void openBottomCard() {
    emit(
      state.copyWith(status: BottomCardStatus.open),
    );
  }

  void closeBottomCard() {
    emit(
      state.copyWith(status: BottomCardStatus.close),
    );
  }
}
