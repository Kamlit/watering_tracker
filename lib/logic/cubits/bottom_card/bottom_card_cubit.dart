import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_card_state.dart';

class BottomCardCubit extends Cubit<BottomCardState> {
  BottomCardCubit() : super(BottomCardHidden());

  void openBottomCard() {
    emit(BottomCardOpen());
  }

  void hideBottomCard() {
    emit(BottomCardHidden());
  }
}
