import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/date_time_util.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class ItemAddingSuccess extends StatefulWidget {
  ItemAddingSuccess({
    required this.dateTime,
    required this.time,
    required this.back,
    required this.goto,
  }) ;
  DateTime dateTime;
  VoidCallback goto;
  VoidCallback back;
  DateTime time;

  @override
  State<ItemAddingSuccess> createState() => _ItemAddingSuccessState();
}

class _ItemAddingSuccessState extends State<ItemAddingSuccess> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.all(20.0),
          decoration: ShapeDecoration(
            color: AppColors.WHITE,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Image.asset('assets/images/success.png'),
              ).paddingOnly(top: 24.h, bottom: 14.h,),
              AppWidgets.textLocale(
                textAlign: TextAlign.center,
                text: LocaleKeys.note_successful_added,
                richText: true,
                othersMarkers: [
                  MarkerText(
                    marker: "//",
                    style: TextStyle(color: AppColorUtils.KRAUDFANDING),
                  ),
                ],
                maxLines: 10,
                height: 1.1,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColorUtils.DARK3,
              ).paddingSymmetric(horizontal: 40),
              Container(
                padding: EdgeInsets.symmetric(vertical: 13),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColorUtils.LEFT_MENU_BACK,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppWidgets.imageSvg(
                      path: AppImageUtils.CALENDAR_RED,
                      color: AppColorUtils.TEXT_COLOR,
                      height: 16,
                    ).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: "${DateTimeUtil.dmy(widget.dateTime, context.locale)}",
                      color: AppColorUtils.TEXT_COLOR,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ).paddingOnly(right: 24.w),
                    AppWidgets.imageSvg(
                      path: AppImageUtils.CLOCK,
                      color: AppColorUtils.TEXT_COLOR,
                      height: 16,
                    ).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: "${DateTimeUtil.hhmm(widget.time, context.locale)}",
                      color: AppColorUtils.TEXT_COLOR,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ).paddingOnly(
                bottom: 24.h,
                right: 30.w,
                left: 30.w,
                top: 20,
              ),
              Column(
                children: [
                  AppWidgets.appButton(
                    onTap: widget.goto,
                    title: LocaleKeys.jump_to_note,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 12.h),
                  AppWidgets.appButton(
                    color: AppColorUtils.LIGHT_GRAY,
                    textColor: AppColorUtils.BLACK,
                    onTap: widget.back,
                    title: LocaleKeys.exit,
                    fontSize: 16.sp,
                  ),
                ],
              ).paddingOnly(
                left: 25,
                right: 25,
                bottom: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
