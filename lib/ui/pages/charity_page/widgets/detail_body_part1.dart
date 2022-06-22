import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/card_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class DetailBodyPart1 extends StatelessWidget {
  const DetailBodyPart1({required this.cardModel, Key? key}) : super(key: key);

  final CardModel cardModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.starTextWidget(text: LocaleKeys.done_date.tr()),
                SizedBox(
                  height: 3.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppImageUtils.date),
                    AppWidgets.text(
                      text: cardModel.date!,
                      color: AppColorUtils.bluePercent,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ).paddingOnly(left: 6.w),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppWidgets.textLocale(
                  text: LocaleKeys.announcement_day,
                  fontWeight: FontWeight.w400,
                  fontSize: 10.sp,
                  color: AppColorUtils.dark6,
                ),
                AppWidgets.text(
                  text: "25.08.2022",
                  color: const Color(0xFF043F3B),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ).paddingOnly(top: 3.w),
              ],
            )
          ],
        ).paddingSymmetric(horizontal: 20.w),
        AppWidgets.starTextWidget(
          text: LocaleKeys.help_type.tr(),
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          color: AppColorUtils.dark6,
        ).paddingOnly(top: 13.w, left: 20.w, bottom: 3.w),
        AppWidgets.text(
                text: "Ovqat qilib berish va uyni yig'ishtirish",
                maxLines: 2,
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: AppColorUtils.greenText)
            .paddingSymmetric(horizontal: 20.w),
        AppWidgets.textLocale(
          text: LocaleKeys.address,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          color: AppColorUtils.dark6,
        ).paddingOnly(
          left: 20.w,
          top: 12.w,
          bottom: 3.w,
        ),
        AppWidgets.text(
          text: "Toshkent Shahar, Mirobod tumani*********",
          fontSize: 14.w,
          fontWeight: FontWeight.w500,
          color: AppColorUtils.textBlue2,
          maxLines: 2,
        ).paddingSymmetric(horizontal: 20.w)
      ],
    );
  }
}
