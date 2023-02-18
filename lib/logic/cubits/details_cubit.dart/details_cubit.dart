import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsHidden());

  void openDetails() {
    emit(DetailsOpen());
  }

  void hideDetails() {
    emit(DetailsHidden());
  }
}
