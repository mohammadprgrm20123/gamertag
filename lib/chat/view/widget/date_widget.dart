import 'package:flutter/cupertino.dart';

import '../../../infrastructure/theme/app_color.dart';
import '../../../infrastructure/utils/datetime_utils.dart';
import '../../../share/widget/app_text.dart';

class MessageDateWidget extends StatelessWidget {
  final DateTime dateTime;

  const MessageDateWidget({required this.dateTime, super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: AppText(
          DatetimeUtils.getPatternDateTimeFormat(dateTime),
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: AppColor.grey),
        ),
      );
}
