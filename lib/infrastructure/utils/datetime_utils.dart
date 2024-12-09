import 'package:jiffy/jiffy.dart';

class DatetimeUtils {
  static String getPatternDateTimeFormat(final DateTime date) {
    String dateTime = '';
    int differenceHour = date.difference(DateTime.now()).inHours.abs();
    if (differenceHour <= 24) {
      dateTime =
          'Today ${Jiffy.parseFromDateTime(date).format(pattern: 'hh:mm')}';
    } else {
      if (differenceHour <= 48 && differenceHour > 24) {
        dateTime =
            'Yesterday ${Jiffy.parseFromDateTime(date).format(pattern: 'hh:mm')}';
      } else {
        dateTime =
            Jiffy.parseFromDateTime(date).format(pattern: 'EEE MMM  d hh:mm');
      }
    }

    return dateTime;
    ;
  }
}
