import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'diary_state.dart';

class DiaryCubit extends Cubit<DiaryState> {
  DiaryCubit() : super(DiaryState());
}
