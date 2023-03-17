part of 'saved_values_cubit.dart';

enum SavedValuesTab { drinkTypes, amounts }

class SavedValuesState extends Equatable {
  const SavedValuesState({
    required this.tab,
  });

  final SavedValuesTab tab;

  SavedValuesState copyWith({
    SavedValuesTab? tab,
  }) {
    return SavedValuesState(
      tab: tab ?? this.tab,
    );
  }

  @override
  List<Object> get props => [tab];
}
