import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_card_page_state.dart';

class BottomCardPageCubit extends Cubit<BottomCardPageState> {
  BottomCardPageCubit()
      : super(
          const BottomCardPageState(
            page: BottomCardPage.details,
          ),
        );

  void changePage(BottomCardPage newPage) {
    emit(
      state.copyWith(page: newPage),
    );
  }
}
