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

  void pageChanging({
    required DateTime newPageDate,
  }) {
    emit(
      state.copyWith(
        status: PageDateStatus.changing,
        pageDate: newPageDate,
      ),
    );
  }

  void pageChanged() {
    emit(
      state.copyWith(
        status: PageDateStatus.changed,
      ),
    );
  }
}
