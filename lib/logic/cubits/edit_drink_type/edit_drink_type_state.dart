part of 'edit_drink_type_cubit.dart';

class EditDrinkTypeState extends Equatable {
  const EditDrinkTypeState({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;

  EditDrinkTypeState copyWith({
    String? name,
    Color? color,
  }) {
    return EditDrinkTypeState(
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  @override
  List<Object> get props => [name, color];
}
