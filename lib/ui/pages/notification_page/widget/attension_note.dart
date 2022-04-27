import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:najot/data/extensions/widget_padding_extension.dart';
import 'package:najot/data/localization/locale_keys.g.dart';
import 'package:najot/data/services/navigator_service.dart';
import 'package:najot/data/styles/app_colors.dart';
import 'package:najot/data/utils/app_color_utils.dart';
import 'package:najot/data/utils/app_image_utils.dart';
import 'package:super_rich_text/super_rich_text.dart';
import '../../../../data/model/volunteering_model.dart';
import '../../../widgets/app_widgets.dart';
import '../../my_volunteering_page/my_volunteering_page.dart';

class AttentionNote extends StatelessWidget {
  static const String routeName = "/attentionNote";

  AttentionNote({required this.model, Key? key}) : super(key: key);
  DateTime _date = DateTime.now();
  DateTime _time = DateTime.now();
  final VolunteeringModel model;

  // VolunteeringModel model;

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    AppWidgets.imageSvg(
                      path: AppImageUtils.NOTIFICATION_GREY,
                      color: AppColorUtils.KRAUDFANDING,
                    ).paddingOnly(
                      right: 5.w,
                      top: 15.w,
                    ),
                    AppWidgets.textLocale(
                      text: LocaleKeys.attention_note,
                      fontSize: 20.sp,
                      color: AppColorUtils.DARK2,
                      fontWeight: FontWeight.w600,
                    ).paddingOnly(
                      top: 20.w,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 24.w),
                AppWidgets.textLocale(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: AppColorUtils.DARK2,
                  maxLines: 2,
                  text: LocaleKeys.hello_volunteer_you_have_to_go_rescue,
                  richText: true,
                  othersMarkers: [
                    MarkerText(
                      marker: "//",
                      style: TextStyle(color: AppColorUtils.KRAUDFANDING),
                    ),
                  ],
                ).paddingOnly(
                  top: 5.w,
                  right: 24.w,
                  left: 24.w,
                  bottom: 11.w,
                ),
                Container(
                  width: double.infinity,
                  color: AppColorUtils.WHITE_GREY,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppWidgets.textLocale(
                        text: LocaleKeys.date,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.DARK_6,
                      ).paddingOnly(bottom: 3.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppWidgets.imageSvg(
                            path: AppImageUtils.CALENDAR_RED,
                            color: AppColorUtils.BLUE_PERCENT,
                            height: 16,
                          ).paddingOnly(right: 5.w),
                          AppWidgets.textLocale(
                            text: model.completedDate!,
                            color: AppColorUtils.BLUE_PERCENT,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      AppWidgets.textLocale(
                        text: LocaleKeys.address,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.DARK_6,
                      ).paddingOnly(bottom: 3.w),
                      AppWidgets.textLocale(
                        text: model.address!,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColorUtils.BLUE_TEXT,
                        maxLines: 2,
                      ).paddingOnly(bottom: 18.w),
                      AppWidgets.starTextWidget(
                        text: LocaleKeys.help_type,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColorUtils.DARK_6,
                      ),
                      AppWidgets.textLocale(
                        text: model.typeVolunteering!,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColorUtils.KRAUDFANDING,
                        maxLines: 2,
                      ).paddingOnly(bottom: 18.w),
                    ],
                  ).paddingOnly(
                    top: 10.w,
                    right: 24.w,
                    left: 24.w,
                  ),
                ).paddingOnly(
                  bottom: 18.w,
                ),
                Column(
                  children: [
                    AppWidgets.appButton(
                      onTap: () {
                        NavigatorService.to
                            .pushReplacementNamed(MyVolunteeringPage.routeName);
                      },
                      title: LocaleKeys.my_volunteering.tr(),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 12.h),
                    AppWidgets.appButton(
                      color: AppColorUtils.SMS_BTN2,
                      textColor: AppColorUtils.KRAUDFANDING,
                      onTap: () {
                        NavigatorService.to.pop();
                      },
                      title: LocaleKeys.notes.tr(),
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
      ),
    );
  }
}
