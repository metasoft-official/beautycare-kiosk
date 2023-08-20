class StringUtil {
  String? dateTimeToString(DateTime? value) {
    if (value == null) {
      return null;
    } else {
      return "${value.year}.${value.month.toString().padLeft(2, '0')}.${value.day.toString().padLeft(2, '0')}";
    }
  }
}
