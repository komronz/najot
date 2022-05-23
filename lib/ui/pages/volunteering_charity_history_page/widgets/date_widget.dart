import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class DateWidget extends StatelessWidget {
  final String date;

  const DateWidget({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Icon(
          Icons.calendar_today_outlined,
          color: AppColorUtils.BLUE_PERCENT,
          size: 14.sp,
        ),
        AppWidgets.text(
          text: date,
          color: AppColorUtils.BLUE_PERCENT,
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
        ).paddingOnly(left: 6.w),
      ],
    );
  }
}
