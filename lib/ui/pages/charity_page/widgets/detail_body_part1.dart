
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/model/project_model.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:najot/ui/widgets/app_widgets.dart';

class DetailBodyPart1 extends StatelessWidget {
   DetailBodyPart1({required this.cardModel});

  ProjectModel cardModel;

  @override
  Widget build(BuildContext context) {
    var modifiedAt= DateTime.parse(cardModel.modifiedAt??"");
    var createAt= DateTime.parse(cardModel.createdAt??"");
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
                    SvgPicture.asset(AppImageUtils.DATE),
                    AppWidgets.text(
                      text: DateFormat("dd.MM.yyyy").format(modifiedAt),
                      color: AppColorUtils.BLUE_PERCENT,
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
                  color: AppColorUtils.DARK_6,
                ),
                AppWidgets.text(
                  text: DateFormat("dd.MM.yyyy").format(createAt),
                  color: Color(0xFF043F3B),
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
          color: AppColorUtils.DARK_6,
        ).paddingOnly(top: 13.w, left: 20.w, bottom: 3.w),
        AppWidgets.text(
            text: cardModel.helpType??"",
            maxLines: 2,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            color: AppColorUtils.GREEN_TEXT)
            .paddingSymmetric(horizontal: 20.w),
        AppWidgets.textLocale(
          text: LocaleKeys.address,
          fontWeight: FontWeight.w400,
          fontSize: 10.sp,
          color: AppColorUtils.DARK_6,
        ).paddingOnly(
          left: 20.w,
          top: 12.w,
          bottom: 3.w,
        ),
        AppWidgets.text(
            text: cardModel.address??"",
            fontSize: 14.w,
            fontWeight: FontWeight.w500,
            color: AppColorUtils.TEXT_BLUE2,
            maxLines: 2)
            .paddingSymmetric(horizontal: 20.w)
      ],
    );
  }
}
