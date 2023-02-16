class DateHelper {
  DateHelper._();

  static DateTime getDateFromPage(int page) {
    var now = DateTime.now();
    return DateTime(now.year, now.month, now.day).add(
      Duration(days: -page),
    );
  }
}
