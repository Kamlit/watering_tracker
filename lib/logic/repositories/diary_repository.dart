import 'package:drink_tracker/TEMP_drink_types.dart';
import 'package:drink_tracker/logic/models/diary_entry.dart';

class DiaryRepository {
  Map<DateTime, List<DiaryEntry>> diary = {};

  void addEntry({required DateTime date, required DiaryEntry entry}) {
    final now = DateTime.now();

    if (diary.containsKey(date)) {
      diary[date]!.add(entry);
    } else {
      diary[date] = [entry];
    }
  }
}
