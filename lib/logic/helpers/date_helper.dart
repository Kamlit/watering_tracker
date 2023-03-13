import 'package:intl/intl.dart';

class DateHelper {
  DateHelper._();

  static DateTime getDateFromPage(int page) {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day).add(
      Duration(days: -page),
    );
  }

  static String formatDate(DateTime date) {
    int dayDifference = date.difference(DateTime.now()).inDays.abs();
    print(dayDifference);
    if(dayDifference == 0) {
      return 'Today';
    }
    else if(dayDifference == 1) {
      return 'Yesterday';
    }
    else  {
      return DateFormat('E, dd.MM.y').format(date);
    }

  }
}
