import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/ui/pages/%20my_volunteering_page/my_volunteering_page.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../data/model/volunteering_model.dart';
import '../../../../data/services/navigator_service.dart';
import '../../../../data/utils/app_color_utils.dart';
import '../../../../data/utils/app_image_utils.dart';
import '../../../widgets/app_widgets.dart';

class WaitingForAddingSuccess extends StatelessWidget {

  WaitingForAddingSuccess(
      {required this.model, required this.selectFunction, Key? key})
      : super(key: key);
  final Function selectFunction;
  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  VolunteeringModel model;

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
              ).paddingOnly(top: 24.h, bottom: 14.h),
              AppWidgets.textLocale(
                textAlign: TextAlign.center,
                text: "Eslatma //muvaffaqiyatli// o'zgartirildi",
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
                  color: Color(0xFFF8FFFD),
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
                      text: model.completedDate!,
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
                      text: "18:00",
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
                    onTap: () {
                      NavigatorService.to.pop();
                    },
                    title: "Eslatmaga utish",
                    fontSize: 16.sp,
                  ),
                  SizedBox(height: 12.h),
                  AppWidgets.appButton(
                    color: AppColorUtils.LIGHT_GRAY,
                    textColor: AppColorUtils.BLACK,
                    onTap: () {
                      NavigatorService.to.pushNamedAndRemoveUntil(MyVolunteeringPage.routeName);

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
