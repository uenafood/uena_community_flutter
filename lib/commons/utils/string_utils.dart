class StringUtils {
  static String extractDateFromISOString(String isoDate) {
    final dateString = isoDate.split('T').first;
    final splittedDate = dateString.split("-");

    final year = splittedDate[0];
    final month = splittedDate[1];
    final date = splittedDate[2];

    return "$date-$month-$year";
  }
}
