class StringUtil {
  String? dateTimeToString({DateTime? value, String? pattern}) {
    if (value == null) {
      return null;
    } else if (pattern != null && pattern.contains('MM.dd')) {
      return "${value.month.toString().padLeft(2, '0')}.${value.day.toString().padLeft(2, '0')}";
    } else {
      return "${value.year}.${value.month.toString().padLeft(2, '0')}.${value.day.toString().padLeft(2, '0')}";
    }
  }
}
