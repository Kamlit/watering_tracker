import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'saved_values_state.dart';

class SavedValuesCubit extends Cubit<SavedValuesState> {
  SavedValuesCubit()
      : super(
          const SavedValuesState(
            tab: SavedValuesTab.drinkTypes,
          ),
        );

  void changeTab(SavedValuesTab newTab) {
    emit(state.copyWith(tab: newTab));
  }

}
