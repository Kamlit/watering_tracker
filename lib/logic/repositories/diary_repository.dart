import 'package:drink_tracker/logic/models/diary_entry.dart';

class DiaryRepository {
  Map<DateTime, List<DiaryEntry>> diary = {};

  int totalAmount(DateTime day) {
    var total = 0;
    for (final element in diary[day]!) {
      total += element.amount;
    }
    return total;
  }

  void addEntry({required DateTime date, required DiaryEntry entry}) {
    if (diary.containsKey(date)) {
      diary[date]!.add(entry);
    } else {
      diary[date] = [entry];
    }
  }
}
