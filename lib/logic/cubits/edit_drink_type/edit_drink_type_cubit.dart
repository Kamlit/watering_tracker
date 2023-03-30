import 'package:drink_tracker/logic/helpers/extensions.dart';
import 'package:drink_tracker/logic/models/drink_type.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_drink_type_state.dart';

class EditDrinkTypeCubit extends Cubit<EditDrinkTypeState> {
  EditDrinkTypeCubit({this.initialDrinkType})
      : super(
          EditDrinkTypeState(
            name: initialDrinkType?.name ?? '',
            color: initialDrinkType?.color.toColor() ?? Colors.red,
          ),
        );

  final DrinkType? initialDrinkType;

  void updateName(String value) {
    emit(state.copyWith(name: value));
  }

  void updateColor(Color value) {
    emit(state.copyWith(color: value));
  }
}
