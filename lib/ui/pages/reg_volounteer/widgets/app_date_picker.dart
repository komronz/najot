import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/date_time_util.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class AppDatePicker extends StatelessWidget {
  final VoidCallback onTap;
  final DateTime? text;
  final String title;

  const AppDatePicker({
    required this.title,
    required this.onTap,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppWidgets.starTextWidget(
          text: title,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColorUtils.DARK_4,
          hasStar: text != null ? false : true,
        ).paddingOnly(bottom: 8),
        GestureDetector(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColorUtils.BORDER_COLOR,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: text == null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        color: AppColorUtils.KRAUDFANDING,
                        size: 22,
                      ).paddingOnly(left: 20),
                      AppWidgets.text(
                        text: LocaleKeys.select.tr(),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: AppColorUtils.KRAUDFANDING,
                      ).paddingOnly(left: 15),
                    ],
                  )
                : Row(
                    children: [
                      AppWidgets.text(
                        text: DateTimeUtil.dmy(
                          text!,
                          context.locale,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ).paddingOnly(left: 10),
                    ],
                  ),
          ),
          onTap: onTap,
        ),
      ],
    ).paddingSymmetric(
      horizontal: 20,
      vertical: 24,
    );
  }
}
