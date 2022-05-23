import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class NotificationDateWidget extends StatelessWidget {
  final String date;

  const NotificationDateWidget({
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String time = DateFormat("HH:mm").format(
      DateTime.parse(date),
    );
    String dated = DateFormat("dd.MM.yyyy").format(
      DateTime.parse(date),
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.calendar_today_outlined,
          color: AppColorUtils.BLUE_PERCENT,
          size: 15.sp,
        ),
        AppWidgets.text(
          text: dated,
          color: AppColorUtils.BLUE_PERCENT,
          fontWeight: FontWeight.w600,
          fontSize: 16.sp,
        ).paddingOnly(
          left: 6.w,
          right: 24.w,
          top: 5.w,
        ),
        AppWidgets.imageSvg(
          path: AppImageUtils.CLOCK,
          color: AppColorUtils.BLUE_PERCENT,
          height: 15.w,
        ).paddingOnly(right: 5.w, top: 2.w),
        AppWidgets.textLocale(
          text: time,
          color: AppColorUtils.BLUE_PERCENT,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
