import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/charity_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/ui/pages/charity_history_page/widgets/date_widget.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class VolunteeringItemWidget extends StatelessWidget {
  final CharityModel model;
  final VoidCallback onTap;

  const VolunteeringItemWidget({
    required this.onTap,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColorUtils.ITEM_CHARITY_COLOR,
        ),
        margin: EdgeInsets.only(bottom: 12, left: 20, right: 20),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.textLocale(
                    text: LocaleKeys.about_the_ad,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    maxLines: 10,
                    color: AppColorUtils.ITEM_CHARITY_TEXT2),
                SizedBox(
                  width: 265.w,
                  child: AppWidgets.text(
                      text: model.title!,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColorUtils.ITEM_CHARITY_TEXT,
                      maxLines: 2)
                      .paddingOnly(top: 3),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      text: LocaleKeys.item_type,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      maxLines: 10,
                      color: AppColorUtils.ITEM_CHARITY_TEXT2,
                    ),
                    AppWidgets.textLocale(
                      text: LocaleKeys.date,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      maxLines: 10,
                      color: AppColorUtils.ITEM_CHARITY_TEXT2,
                    ),
                  ],
                ).paddingOnly(top: 12.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                      text: "Oyoq kiyim",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColorUtils.KRAUDFANDING,
                    ),
                    DateWidget(date: model.createdDate!),
                  ],
                ).paddingOnly(top: 3),
              ],
            ).paddingAll(12),

          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
