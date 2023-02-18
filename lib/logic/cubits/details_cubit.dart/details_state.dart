part of 'details_cubit.dart';

@immutable
abstract class DetailsState extends Equatable {}

class DetailsOpen extends DetailsState {
  @override
  List<Object?> get props => [];
}

class DetailsHidden extends DetailsState {
  @override
  List<Object?> get props => [];
}
