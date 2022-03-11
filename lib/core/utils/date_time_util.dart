import 'package:intl/intl.dart';

String fullDateFormat(DateTime date) {
  return '${DateFormat('EEE dd-MMM-yyyy ').format(date)} at ${DateFormat.jms().format(date)}';
}

String shortDateFormat(DateTime date) {
  return '${DateFormat('EEE dd-MMM-yyyy ').format(date)} at ${DateFormat.jms().format(date)}';
}

String dateFormatToDayWithDate(DateTime date) {
  return DateFormat('EEE dd-MMM-yyyy ').format(date);
}

String dateFormatToDay(DateTime date) {
  return DateFormat('MMM dd,yyyy').format(date);
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

String dateFormatToDayAsia(DateTime date) {
  return DateFormat('EEEE dd-MMMM-yyyy ').format(date);
}

String timeStampGeneratedFromDate(DateTime date) {
  return DateFormat('yyMMddHHmmSS').format(date);
}

String dateFormatToHourMn(DateTime date) {
  return DateFormat.jm().format(date);
  // return DateFormat('kk:mm').format(date);
}
