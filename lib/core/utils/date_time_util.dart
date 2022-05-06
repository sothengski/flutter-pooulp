import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String formatToPattern(String pattern) {
    final DateFormat formatter = DateFormat(pattern);
    return formatter.format(this);
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate({DateTime? other}) {
    return year == other!.year && month == other.month && day == other.day;
  }
}

String fullDateFormat({DateTime? date}) {
  return '${DateFormat('EEE dd-MMM-yyyy').format(date!)} • ${DateFormat.jms().format(date)}';
}

String shortDateFormat({DateTime? date}) {
  return '${DateFormat('EEE dd-MMM-yyyy').format(date!)} • ${DateFormat.jms().format(date)}';
}

String slashDateTimeFormat({DateTime? date}) {
  return '${DateFormat('dd/MM/yyyy').format(date!)} • ${DateFormat.jm().format(date)}';
}

String dateFormatToDayWithDate({DateTime? date}) {
  return DateFormat('EEE dd-MMM-yyyy ').format(date!);
}

String dateFormatToDay({DateTime? date}) {
  return DateFormat('MMM dd,yyyy').format(date!);
}

String dateFormatDashYYYYMMDD({DateTime? date}) {
  return date == null ? "" : DateFormat('yyyy-MM-dd').format(date);
}

String dateFormatSlashYYYYMMDD({DateTime? date}) {
  return date == null ? "" : DateFormat('yyyy/MM/dd').format(date);
}

String dateFormatSlashDDMMYYYY({DateTime? date}) {
  return date == null ? "" : DateFormat('dd/MM/yyyy').format(date);
}

String dateFormatToDayAsia({DateTime? date}) {
  return DateFormat('EEEE dd-MMMM-yyyy ').format(date!);
}

String timeStampGeneratedFromDate({DateTime? date}) {
  return DateFormat('yyMMddHHmmSS').format(date!);
}

String dateFormatToHourMn({DateTime? date}) {
  return DateFormat.jm().format(date!);
  // return DateFormat('kk:mm').format(date);
}

String dateFormatTo24HourMn({DateTime? date}) {
  // return DateFormat('HH:mm').format(date!);
  return DateFormat('kk:mm').format(date!);
}

int dateTimeConvertToSecond({int? hour = 0, int? minute = 0, int? second = 0}) {
  return (hour! * 3600) + (minute! * 60) + second!;
}

String intToActuallyHoursMins({
  int? value,
  bool? clock24 = true,
}) {
  int h;
  int m;
  // int s;

  String hourLeft;
  String minuteLeft;
  String result = '';
  h = value! ~/ 3600;

  m = (value - h * 3600) ~/ 60;

  // s = value - (h * 3600) - (m * 60);

  hourLeft = h.toString().length < 2 ? "0$h" : h.toString();

  minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

  // final String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

  if (!clock24!) {
    if (h > 12) {
      h %= 12;
      hourLeft = h.toString().length < 2 ? "0$h" : h.toString();
      result = "$hourLeft:$minuteLeft PM";
    } else {
      result = "$hourLeft:$minuteLeft AM";
    }
  } else {
    result = "$hourLeft:$minuteLeft";
  }

  return result;
}

String intToTimeLeft(int value) {
  int h;
  int m;
  int s;

  h = value ~/ 3600;

  m = (value - h * 3600) ~/ 60;

  s = value - (h * 3600) - (m * 60);

  final String hourLeft = h.toString().length < 2 ? "0$h" : h.toString();

  final String minuteLeft = m.toString().length < 2 ? "0$m" : m.toString();

  final String secondsLeft = s.toString().length < 2 ? "0$s" : s.toString();

  final String result = "$hourLeft:$minuteLeft:$secondsLeft";

  return result;
}
