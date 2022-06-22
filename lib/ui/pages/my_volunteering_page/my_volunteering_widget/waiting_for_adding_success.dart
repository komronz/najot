import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../data/model/volunteering_model.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../../data/utils/date_time_util.dart';
import '../../../widgets/app_widgets.dart';

class WaitingForAddingSuccess extends StatelessWidget {
  WaitingForAddingSuccess(
      {required this.model, required this.dateTime, Key? key})
      : super(key: key);
  final DateTime dateTime;

  // DateTime _dateTime = DateTime.now();
  final TimeOfDay timeOfDay = TimeOfDay.now();
  final VolunteeringModel model;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          decoration: ShapeDecoration(
            color: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/success.png')
                  .paddingOnly(top: 24.h, bottom: 14.h),
              AppWidgets.textLocale(
                textAlign: TextAlign.center,
                text: LocaleKeys.note_successful_added,
                richText: true,
                othersMarkers: [
                  MarkerText(
                    marker: "//",
                    style: const TextStyle(color: AppColorUtils.kraudfanding),
                  ),
                ],
                maxLines: 10,
                height: 1.1,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: AppColorUtils.dark3,
              ).paddingSymmetric(horizontal: 40),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 13),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColorUtils.greenLight,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppWidgets.imageSvg(
                      path: AppImageUtils.calendarRed,
                      color: AppColorUtils.textColor,
                      height: 16,
                    ).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: DateTimeUtil.dmy(dateTime, context.locale),
                      color: AppColorUtils.textColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ).paddingOnly(right: 24.w),
                    AppWidgets.imageSvg(
                      path: AppImageUtils.clock,
                      color: AppColorUtils.textColor,
                      height: 16,
                    ).paddingOnly(right: 5),
                    AppWidgets.textLocale(
                      text: DateTimeUtil.hhmm(dateTime, context.locale),
                      color: AppColorUtils.textColor,
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
                    onTap: () {
                      NavigatorService.to.pop();
                    },
                    title: LocaleKeys.jump_to_note,
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 12.h),
                  AppWidgets.appButton(
                    color: AppColorUtils.lightGray,
                    textColor: AppColorUtils.black,
                    onTap: () {
                      NavigatorService.to.pop();
                    },
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
