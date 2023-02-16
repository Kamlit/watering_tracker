import 'package:hydrated_bloc/hydrated_bloc.dart';

class GoalCubit extends HydratedCubit<int> {
  GoalCubit() : super(2000);

  void onChangeGoal(int newGoal) {
    emit(newGoal);
  }

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['goal'] as int;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'goal': state};
  }
}
