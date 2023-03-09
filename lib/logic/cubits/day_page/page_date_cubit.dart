
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_date_state.dart';

class PageDateCubit extends Cubit<PageDateState> {
  PageDateCubit()
      : super(
          PageDateState(
            status: PageDateStatus.changed,
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
        status: PageDateStatus.changed,
        pageDate: newPageDate,
      ),
    );
  }

  void pageJumped({
    required DateTime newPageDate,
  }) {
    emit(
      state.copyWith(
        status: PageDateStatus.jumped,
        pageDate: newPageDate,
      ),
    );
  }
}
