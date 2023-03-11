import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_state.dart';

class PageCubit extends Cubit<PageState> {
  PageCubit()
      : super(
          PageState(
            status: PageStatus.changed,
            pageDate: DateTime(
              DateTime.now().year,
              DateTime.now().month,
              DateTime.now().day,
            ),
          ),
        );

  void pageChanged({
    required DateTime newPageDate,
  }) {
    emit(
      state.copyWith(
        status: PageStatus.changed,
        pageDate: newPageDate,
      ),
    );
  }

  void requestPageJump({
    required DateTime newPageDate,
  }) {
    emit(
      state.copyWith(
        status: PageStatus.jumpRequested,
        pageDate: newPageDate,
      ),
    );
  }
}
