import 'package:json_annotation/json_annotation.dart';

part 'drink_type.g.dart';

@JsonSerializable()
class DrinkType {
  DrinkType({
    required this.name,
    required this.color,
  });

  factory DrinkType.fromJson(Map<String, dynamic> json) =>
      _$DrinkTypeFromJson(json);

  final String name;
  final String color;

  Map<String, dynamic> toJson() => _$DrinkTypeToJson(this);

  @override
  String toString() {
    return 'DrinkType{$name}';
  }
}
