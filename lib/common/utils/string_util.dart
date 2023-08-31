import 'package:intl/intl.dart';

class StringUtil {
  String? dateTimeToString({DateTime? value, String? pattern}) {
    if (value == null) {
      return null;
    } else {
      DateFormat formatter = DateFormat(pattern ?? 'yyyy.MM.dd');
      return formatter.format(value);
    }
  }

  String removeTrailingNewlines(String input) {
    return input.replaceAll(RegExp(r'\n+$'), '');
  }

  int? stringToInt(value) {
    if (value != null && value != "") {
      if (value is int) {
        return value;
      } else {
        return int.parse(value);
      }
    } else {
      return null;
    }
  }

  double? stringToDouble(value) {
    if (value != null) {
      if (value is double) {
        return value;
      } else {
        return double.parse(value);
      }
    } else {
      return null;
    }
  }

  String? datetimeToLocalDate(DateTime? value) {
    if (value == null) {
      return null;
    } else {
      return DateFormat("yyyy-MM-dd").format(value);
    }
  }

  String? datetimeToLocalDateTime(DateTime? value) {
    if (value == null) {
      return null;
    } else {
      return DateFormat("yyyy-MM-dd HH:mm:ss").format(value);
    }
  }

  String? datetimeToLocalDateHM(DateTime? value) {
    if (value == null) {
      return null;
    } else {
      return DateFormat("yyyy-MM-dd HH:mm").format(value);
    }
  }

  String? dayFromNow(DateTime? value) {
    String? dDay;
    if (value != null) {
      int? result = value.difference(DateTime.now()).inDays + 1;
      if (result > 0) {
        dDay = result.toString();
      } else {
        dDay = 'Day';
      }
      return dDay;
    } else {
      return null;
    }
  }

  String? dayFromNowReverse(DateTime? value) {
    String? dDay;
    if (value != null) {
      int? result = DateTime.now().difference(value).inDays + 1;
      if (result > 0) {
        dDay = result.toString();
      } else {
        dDay = '0';
      }
      return dDay;
    } else {
      return null;
    }
  }
}
