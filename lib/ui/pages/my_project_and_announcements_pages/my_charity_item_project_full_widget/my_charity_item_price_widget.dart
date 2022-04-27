import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';

import '../../../../data/localization/locale_keys.g.dart';
import '../../../../data/model/charity_model.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../widgets/app_widgets.dart';

class MyCharityItemPriceWidget extends StatelessWidget {
  final CharityModel model;

  const MyCharityItemPriceWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(
                  text: LocaleKeys.date_of_completion,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today_outlined,
                      color: AppColorUtils.BLUE_PERCENT,
                      size: 14.sp,
                    ),
                    AppWidgets.text(
                      text: model.collectedDate!,
                      color: AppColorUtils.BLUE_PERCENT,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ).paddingOnly(left: 6.w),
                  ],
                ).paddingOnly(top: 5.w)
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.day_of_the_announcement,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColorUtils.DARK_6,
                ),
                AppWidgets.text(
                  text: model.createdDate!,
                  color: AppColorUtils.TEXT_GREEN2,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 5.w),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.starTextWidget(
              text: LocaleKeys.item_type,
            ).paddingOnly(bottom: 5.w),
            AppWidgets.textLocale(
              text: model.typeOfHelp!,
              color: AppColorUtils.KRAUDFANDING,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ).paddingOnly(bottom: 12.w),
            AppWidgets.textLocale(
              text: LocaleKeys.address,
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              color: AppColorUtils.DARK_6,
            ),
            AppWidgets.textLocale(
              text: "Toshkent Shahar, Mirobod tumani, A Qodiriy 48",
              color: AppColorUtils.BLUE_TEXT,
              maxLines: 2,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ).paddingOnly(
              top: 3.w,
              right: 60.w,
              bottom: 12.w,
            ),
            Divider(
              thickness: 2,
            ),
          ],
        ).paddingOnly(top: 12.w),
      ],
    );
  }
}
